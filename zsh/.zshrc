export PATH="$HOME/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export EDITOR=nvim
export VISUAL=nvim

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

alias wd="pwd"
alias tm="tmux"
alias nv="nvim"
alias cl="clear"
alias py="python"
alias ls="eza --icons"

if command -v tm >/dev/null && [ -z "$TMUX" ]; then
  if tm has-session 2>/dev/null; then
    tm attach-session
  else
    tm new-session
  fi
fi

function go() {
  z desktop 2> /dev/null
  nv a.cpp
}

function clear_() {
  local files=("algo/io/in" "algo/io/out1" "algo/io/out2" "algo/io/bugs")

  for f in "${files[@]}"; do
    rm "$f" 2> /dev/null
    touch "$f" 2> /dev/null
  done
}

function build() {
  local bin="$1"
  shift
  local sources=("$@")

  if [[ ${#sources[@]} -eq 0 ]]; then
    return 1
  fi

  local needs_build=0
  if [[ ! -f "$bin" ]]; then
    needs_build=1
  else
    for src in "${sources[@]}"; do
      if [[ "$src" -nt "$bin" ]]; then
        needs_build=1
        break
      fi
    done
  fi

  if [[ $needs_build -eq 1 ]]; then
    g++ "${sources[@]}" -o "$bin" || return 1
  fi
}

function run() {
  if [[ $# -eq 0 ]]; then
    return 1
  fi

  clear_

  local bin="algo/bin/main"
  local bugs="algo/io/bugs"
  local sources=()

  for arg in "$@"; do
    sources+=("${arg}.cpp")
  done

  build "$bin" "${sources[@]}" || return 1
  ./"$bin" 2> "$bugs"

  see
}

function stress() {
  if [[ $# -eq 0 ]]; then
    return 1
  fi
  
  local sol="$1"
  local tl="${2:-2}"

  local main="algo/bin/main"
  local gen="algo/bin/gen"
  local brute="algo/bin/brute"

  build "$main" "${sol}.cpp" || return 1
  build "$gen" "algo/stress/gen.cpp" || return 1
  build "$brute" "algo/stress/brute.cpp" || return 1

  local in="algo/io/in"
  local out1="algo/io/out1"
  local out2="algo/io/out2"
  local bugs="algo/io/bugs"

  local tc=0
  local max_tc=500
  local ok=1

  while (( tc < max_tc )); do
    clear_

    (( tc++ ))
    
    ./"$gen" > "$in"

    if ! timeout "$tl"s ./"$main" < "$in" > "$out1" 2> "$bugs"; then
      code=$?
      if [[ $code -eq 124 ]]; then
        echo "TLE"
      else
        echo "RE"
      fi
      see
      ok=0
      break
    fi

    ./"$brute" < "$in" > "$out2"
    
    if ! diff -w -q "$out1" "$out2" >/dev/null; then
      echo "WA"
      see
      ok=0
      break
    fi
  done

  if [[ $ok -eq 1 ]]; then
    echo "OK"
  fi
}

function see() {

  function print_() {
    local label="$1"
    local file="$2"
    if [[ -s "$file" ]]; then
      echo "$label"
      cat "$file"
      echo
    fi
  }

  echo
  print_ "Input:" "algo/io/in"
  print_ "Output:" "algo/io/out1"
  print_ "Expected:" "algo/io/out2"
  print_ "Bugs:" "algo/io/bugs"
}

source ~/.dotfiles/zsh/highlighting/a.plugin.zsh
