go() {
  z ~/Desktop/cp
  cp algo/template a.cpp
  nv a.cpp
}

in() {
  if [ -d "algo" ]; then
    cat > "algo/in"
  fi
}

build() {
  local bin="algo/main"
  local sources=("$@")

  local rebuild=false
  if [ ! -f "$bin" ]; then
    rebuild=true
  else
    for src in "${sources[@]}"; do
      if [ "$src" -nt "$bin" ]; then
        rebuild=true
        break
      fi
    done
  fi
  if $rebuild; then
    mkdir -p "$(dirname "$bin")"
    g++ -o "$bin" "${sources[@]}"
  fi
}

run() {
  local bin="algo/main"
  local in="/dev/stdin"

  if [ "$1" = "-" ]; then
    in="algo/in"
    shift
  fi

  build "$@"
  ./"$bin" < "$in"
}
