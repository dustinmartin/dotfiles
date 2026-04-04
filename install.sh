#!/bin/bash
set -e

info() {
  printf '==> %s\n' "$1"
}

success() {
  printf '✔ %s\n' "$1"
}

warn() {
  printf 'Warning: %s\n' "$1"
}

optional_failures=()

record_optional_failure() {
  optional_failures+=("$1")
  warn "$1"
}

if ! command -v brew >/dev/null 2>&1; then
  warn "Homebrew is required but was not found."
  echo "Install it first with:"
  echo '/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"'
  exit 1
fi

platform="$(uname -s)"
info "Detected platform: $platform"

info "Creating config directories"
mkdir -p "$HOME/.config"
mkdir -p "$HOME/.config/fish/conf.d"
mkdir -p "$HOME/.config/fish/functions"
mkdir -p "$HOME/.config/ghostty"
mkdir -p "$HOME/.config/tmuxinator"
success "Config directories ready"

formulae=(fish git zoxide starship ripgrep fd fzf neovim tmux tmuxinator fnm tree-sitter eza)
casks=(ghostty font-jetbrains-mono-nerd-font)

info "Installing Homebrew formulae"
brew install "${formulae[@]}"
success "Homebrew formulae installed"

info "Installing Homebrew casks"
if brew install --cask "${casks[@]}"; then
  success "Homebrew casks installed"
else
  record_optional_failure "One or more Homebrew casks failed to install; continuing."
fi

info "Linking Neovim config"
ln -sf ~/dotfiles/vim ~/.config/nvim
success "Neovim config linked"

info "Linking Git config"
ln -sf ~/dotfiles/git/gitignore ~/.gitignore
if [ ! -f ~/.gitconfig ]; then
  cat <<EOF > ~/.gitconfig
[user]
  email = <EMAIL HERE>
[include]
  path = ~/dotfiles/git/gitconfig
EOF
  success "Created ~/.gitconfig — update your email in it."
else
  success "Using existing ~/.gitconfig"
fi

info "Linking tmux config"
cat <<EOF > ~/.tmux.conf
source ~/dotfiles/tmux/tmux.conf
EOF
ln -sf ~/dotfiles/tmuxinator ~/.config/tmuxinator
success "Tmux config linked"

info "Linking Fish config"
ln -sf ~/dotfiles/fish/conf.d/dotfiles.fish ~/.config/fish/conf.d/dotfiles.fish
for f in ~/dotfiles/fish/functions/*.fish; do
  ln -sf "$f" "$HOME/.config/fish/functions/$(basename "$f")"
done
success "Fish config linked"

info "Linking Ghostty config"
ln -sf ~/dotfiles/ghostty/config ~/.config/ghostty/config
success "Ghostty config linked"

info "Configuring default shell"
fish_path="$(command -v fish || true)"
if [ -n "$fish_path" ]; then
  if chsh -s "$fish_path"; then
    success "Default shell changed to fish: $fish_path"
  else
    record_optional_failure "Unable to change default shell automatically. Run: chsh -s $fish_path"
  fi
else
  record_optional_failure "Fish was not found on PATH after installation; skipping shell change."
fi

if [ ${#optional_failures[@]} -gt 0 ]; then
  warn "Install completed with optional steps skipped or failed:"
  for failure in "${optional_failures[@]}"; do
    printf '  - %s\n' "$failure"
  done
else
  success "All install steps completed successfully"
fi
