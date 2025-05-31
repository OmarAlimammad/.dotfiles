link() {
    local source=$1
    local target=$2

    if [ -e "$target" ] || [ -L "$target" ]; then
        echo "🔁 $target already exists. Backing it up to $target.backup"
        mv "$target" "$target.backup"
    fi

    echo "🔗 Linking $target → $source"
    ln -s "$source" "$target"
}

# Zsh
link "~/.dotfiles/zsh/.zshrc" "~/.zshrc"
link "~/.dotfiles/zsh/starship.toml" "~/.config/starship.toml"

# Tmux
link "~/.dotfiles/tmux/.tmux" "~/.tmux"
link "~/.dotfiles/tmux/.tmux.conf" "~/.tmux.conf"

# Nvim
link "~/.dotfiles/nvim" "~/.config/nvim"

# Alacritty
link "~/.dotfiles/alacritty" "~/.config/alacritty"
