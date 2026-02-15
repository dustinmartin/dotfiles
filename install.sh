set -e

# chsh -s /bin/zsh

# sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# # Install Homebrew
# /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# # Install Homebrew apps and utils
# brew tap Homebrew/bundle
# brew bundle

# Create Projects folder
mkdir -p "$HOME/Projects"
mkdir -p "$HOME/.config"

ln -s ~/dotfiles/vim ~/.config/nvim
# ln -s ~/dotfiles/alacritty ~/.config/alacritty
# ln -s ~/dotfiles/kitty ~/.config/kitty
ln -s ~/dotfiles/git/gitignore ~/.gitignore

cat <<EOF > ~/.gitconfig
[user]
  email = <EMAIL HERE>
[include]
  path = ~/dotfiles/git/gitconfig
EOF

cat <<EOF > ~/.zshrc
export ZSH=~/.oh-my-zsh

ZSH_THEME="af-magic"

plugins=(
  git
)

source $ZSH/oh-my-zsh.sh

source ~/dotfiles/zsh/zshrc
EOF

cat <<EOF > ~/.tmux.conf
source ~/dotfiles/tmux/tmux.conf
EOF

# Fish shell
mkdir -p "$HOME/.config/fish/conf.d"
mkdir -p "$HOME/.config/fish/functions"
ln -sf ~/dotfiles/fish/conf.d/dotfiles.fish ~/.config/fish/conf.d/dotfiles.fish
for f in ~/dotfiles/fish/functions/*.fish; do
  ln -sf "$f" "$HOME/.config/fish/functions/$(basename "$f")"
done

