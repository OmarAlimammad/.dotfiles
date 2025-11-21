# --- PATH & Editor ---
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export EDITOR=nvim
export VISUAL=nvim

# --- Prompt & Navigation ---
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

# --- Aliases ---
alias wd="pwd"
alias tm="tmux"
alias nv="nvim"
alias cl="clear"
alias py="python"
alias ls="eza --icons"

# --- Auto tmux attach ---
if command -v tm >/dev/null && [ -z "$TMUX" ]; then
  if tm has-session 2>/dev/null; then
    tm attach-session
  else
    tm new-session
  fi
fi

# --- Yazi ---
function y() {
  local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
  yazi "$@" --cwd-file="$tmp"
  IFS= read -r -d '' cwd < "$tmp"
  [ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
  rm -f -- "$tmp"
}

# --- Sources ---
source ~/.dotfiles/zsh/highlighting/a.plugin.zsh
source ~/.dotfiles/zsh/cp.zsh

