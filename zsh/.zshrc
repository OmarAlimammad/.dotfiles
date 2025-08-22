# u sure ???

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
  z desktop
  cl
  nv a.cpp
}

function run() {
    if [[ $# -eq 0 ]]; then
        return 1
    fi

    # name of the binary (use "main", but you can pick $1 if you want)
    local bin="main"

    # build list of source files
    local sources=()
    for arg in "$@"; do
        sources+=("${arg}.cpp")
    done

    # check if we need to recompile (binary doesn't exist or any source is newer)
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

    ./"$bin" 2> bugs
}

function minecraft() {
    __NV_PRIME_RENDER_OFFLOAD=1 \
    __GLX_VENDOR_LIBRARY_NAME=nvidia \
    __VK_LAYER_NV_optimus=NVIDIA_only \
    DRI_PRIME=1 \
    java -jar ~/.minecraft.jar
}

source ~/.dotfiles/zsh/highlighting/a.plugin.zsh
