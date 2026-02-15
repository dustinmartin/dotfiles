#!/bin/bash
set -e

# Neovim
ln -sf ~/dotfiles/vim ~/.config/nvim

# Git
ln -sf ~/dotfiles/git/gitignore ~/.gitignore
if [ ! -f ~/.gitconfig ]; then
  cat <<EOF > ~/.gitconfig
[user]
  email = <EMAIL HERE>
[include]
  path = ~/dotfiles/git/gitconfig
EOF
  echo "Created ~/.gitconfig — update your email in it."
fi

# Tmux
cat <<EOF > ~/.tmux.conf
source ~/dotfiles/tmux/tmux.conf
EOF

# Fish
mkdir -p "$HOME/.config/fish/conf.d"
mkdir -p "$HOME/.config/fish/functions"

ln -sf ~/dotfiles/fish/conf.d/dotfiles.fish ~/.config/fish/conf.d/dotfiles.fish
for f in ~/dotfiles/fish/functions/*.fish; do
  ln -sf "$f" "$HOME/.config/fish/functions/$(basename "$f")"
done

# Ghostty
mkdir -p "$HOME/.config/ghostty"
ln -sf ~/dotfiles/ghostty/config ~/.config/ghostty/config

echo ""
echo "Done. Manual steps:"
echo "  1. Set fish as default shell: chsh -s $(which fish)"
echo "  2. Install tools: brew install zoxide starship ripgrep fzf neovim tmux fnm"
echo "  3. Install fonts: brew install --cask font-jetbrains-mono-nerd-font"
echo "  4. Generate SSH key: ssh-keygen -t ed25519"
