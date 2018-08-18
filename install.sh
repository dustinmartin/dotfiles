chsh -s /bin/zsh

sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Move the .zshrc file that oh-my-zsh creates
mv ~/.zshrc ~/.zshrc.oh-my-zsh

# Install Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install Homebrew apps and utils
brew tap Homebrew/bundle
brew bundle

# Create Projects folder
mkdir -p "$HOME/Projects"
mkdir -p "$HOME/.config"

ln -s ~/dotfiles/vim ~/.config/nvim
ln -s ~/dotfiles/alacritty ~/.config/alacritty
ln -s ~/dotfiles/git/gitignore ~/.gitignore
ln -s ~/dotfiles/ssh/config ~/.ssh/config

cat <<EOF > ~/.gitconfig
[user]
  email = <EMAIL HERE>
[include]
  path = ~/dotfiles/git/gitconfig
EOF

cat <<EOF > ~/.zshrc
export ZSH=/Users/dmartin2/.oh-my-zsh

ZSH_THEME="af-magic"

plugins=(
  git
  vi-mode
)

source $ZSH/oh-my-zsh.sh

source ~/dotfiles/zsh/zshrc
EOF

cat <<EOF > ~/.tmux.conf
source ~/dotfiles/tmux/tmux.conf
EOF

