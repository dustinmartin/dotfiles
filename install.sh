#!/bin/bash
set -e

if ! command -v brew >/dev/null 2>&1; then
  echo "Homebrew is required but was not found."
  echo "Install it first with:"
  echo '/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"'
  exit 1
fi

mkdir -p "$HOME/.config"
mkdir -p "$HOME/.config/fish/conf.d"
mkdir -p "$HOME/.config/fish/functions"
mkdir -p "$HOME/.config/ghostty"
mkdir -p "$HOME/.config/tmuxinator"

# Homebrew packages
echo "Installing Homebrew packages..."
brew install fish git zoxide starship ripgrep fd fzf neovim tmux tmuxinator fnm tree-sitter eza
brew install --cask ghostty font-jetbrains-mono-nerd-font

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

# Tmuxinator
ln -sf ~/dotfiles/tmuxinator ~/.config/tmuxinator

# Fish
ln -sf ~/dotfiles/fish/conf.d/dotfiles.fish ~/.config/fish/conf.d/dotfiles.fish
for f in ~/dotfiles/fish/functions/*.fish; do
  ln -sf "$f" "$HOME/.config/fish/functions/$(basename "$f")"
done

# Ghostty
ln -sf ~/dotfiles/ghostty/config ~/.config/ghostty/config

fish_path="$(command -v fish || true)"
if [ -n "$fish_path" ]; then
  if chsh -s "$fish_path"; then
    echo "Default shell changed to fish: $fish_path"
  else
    echo "Unable to change default shell to fish automatically."
    echo "You can run this manually after ensuring the path is in /etc/shells:"
    echo "chsh -s $fish_path"
  fi
else
  echo "Fish was not found on PATH after installation; skipping shell change."
fi

echo "Done"
