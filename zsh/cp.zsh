# in() - feed input to algo/in
function in() {
  if [[ -d "algo" ]]; then
    cat > "algo/in"
  else
    return 1
  fi
}

# global variable to track last-used flag
LAST_FLAG=""

# build() - compile sources into binary with flag
function build() {
  local flag="$1"; shift
  local bin="$1"; shift
  local sources=()

  for src in "$@"; do
    [[ "$src" == *.cpp ]] || src="${src}.cpp"
    [[ -f "$src" ]] || { echo "Source file '$src' does not exist"; return 1; }
    sources+=("$src")
  done

  local need_build=0

  # rebuild if binary doesn't exist
  [[ ! -f "$bin" ]] && need_build=1

  # rebuild if any source is newer
  if [[ $need_build -eq 0 ]]; then
    for src in "${sources[@]}"; do
      [[ "$src" -nt "$bin" ]] && { need_build=1; break; }
    done
  fi

  # rebuild if flag changed
  if [[ $need_build -eq 0 ]]; then
    [[ "$LAST_FLAG" != "$flag" ]] && need_build=1
  fi

  if (( need_build )); then
    g++ "$flag" "${sources[@]}" -o "$bin" || return 1
    LAST_FLAG="$flag"
  fi
}

# run() - compile and run program with optional flags
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

  # choose flag: -DLOCAL if show_err, else -O2
  local flag
  if (( show_err )); then
    flag="-DLOCAL"
  else
    flag="-O2"
  fi

  build "$flag" "$bin" "${sources[@]}" || { rm -f "$errfile"; return 1; }

  "./$bin" < "$input" 2> "$errfile"

  if (( show_err )) && [[ -s "$errfile" ]]; then
    echo
    cat "$errfile"
  fi

  rm -f "$errfile"
}

