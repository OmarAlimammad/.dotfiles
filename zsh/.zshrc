export PATH="$HOME/.cargo/bin:$PATH"

export EDITOR=nvim
export VISUAL=nvim

eval "$(starship init zsh)"

if command -v tmux >/dev/null && [ -z "$TMUX" ]; then
    if tmux has-session 2>/dev/null; then
        tmux attach-session
    else
        tmux new-session
    fi
fi

run() {
    if [[ -z "$1" ]]; then
        return 1
    fi

    local src="$1.cpp"
    local bin="$1"

    if [[ ! -f "$bin" || "$src" -nt "$bin" ]]; then
        g++ "$src" -o "$bin"
        if [[ $? -ne 0 ]]; then
            return 1
        fi
    fi

    ./"$bin"
}

minecraft() {
    __NV_PRIME_RENDER_OFFLOAD=1 \
    __GLX_VENDOR_LIBRARY_NAME=nvidia \
    __VK_LAYER_NV_optimus=NVIDIA_only \
    DRI_PRIME=1 \
    java -jar ~/.minecraft.jar
}

alias tm="tmux"
alias nv="nvim"
alias cl="clear"
alias py="python"
alias ls="eza --icons"
alias neofetch="neowofetch"

source ~/.zsh/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
