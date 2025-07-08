export PATH="$HOME/.cargo/bin:$PATH"
export EDITOR=nvim
export VISUAL=nvim

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

if command -v tmux >/dev/null && [ -z "$TMUX" ]; then
    if tmux has-session 2>/dev/null; then
        tmux attach-session
    else
        tmux new-session
    fi
fi

function run() {
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

function minecraft() {
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

source ~/.dotfiles/zsh/highlighting/a.plugin.zsh
