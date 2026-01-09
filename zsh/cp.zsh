in() {
  cat > "input"
}

mo() {
  wl-copy < "a.cpp"
}

build() {
  local bin="bin"
  local rebuild=0

  [[ ! -f $bin ]] && rebuild=1

  for src in "$@"; do
    [[ $src -nt $bin ]] && { rebuild=1; break; }
  done

  if (( rebuild )); then
    g++ -o "$bin" "$@"
  fi
}

run() {
  local bin="bin"
  local infile="/dev/stdin"

  if [[ $1 == "-" ]]; then
    infile="input"
    shift
  fi

  build "$@"
  ./"$bin" < "$infile"
}
