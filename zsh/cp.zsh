function in() {
  if [[ -d "algo" ]]; then
    cat > "algo/in"
  else
    return 1
  fi
}

function go() {
  cd ~/Desktop/cp || { echo "Directory not found"; return 1 }
  cp algo/template a.cpp || { echo "Template missing"; return 1 }
  nv a.cpp
}

function build() {
  local bin="$1"; shift
  local sources=()

  for src in "$@"; do
    [[ "$src" == *.cpp ]] || src="${src}.cpp"
    [[ -f "$src" ]] || { echo "Source file '$src' does not exist"; return 1; }
    sources+=("$src")
  done

  local need_build=0
  if [[ ! -f "$bin" ]]; then
    need_build=1
  else
    for src in "${sources[@]}"; do
      [[ "$src" -nt "$bin" ]] && { need_build=1; break; }
    done
  fi

  if (( need_build )); then
    g++ -O2 "${sources[@]}" -o "$bin" || return 1
  fi
}

function run() {
  [[ $# -eq 0 ]] && return 1

  local bin="algo/main"
  local input="/dev/stdin"
  local show_err=0
  local sources=()

  while [[ $# -gt 0 ]]; do
    case "$1" in
      \@) input="algo/in" ;;
      \#) show_err=1 ;;
      *)
        local s="$1"
        [[ "$s" == *.cpp ]] || s="$s.cpp"
        sources+=("$s")
        ;;
    esac
    shift
  done

  [[ ${#sources[@]} -gt 0 ]] || { echo "No source files provided"; return 1; }

    local errfile
    errfile=$(mktemp)

    build "$bin" "${sources[@]}" || { rm -f "$errfile"; return 1; }

    "./$bin" < "$input" 2> "$errfile"

    echo

    if (( show_err )) && [[ -s "$errfile" ]]; then
      cat "$errfile"
    fi

    rm -f "$errfile"
  }

