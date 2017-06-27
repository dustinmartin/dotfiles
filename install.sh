chsh -s /bin/zsh

# Install Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install Homebrew apps and utils
brew tap Homebrew/bundle
brew bundle

# Create Projects folder
mkdir -p "$HOME/Projects"
mkdir -p "$HOME/.config"

ln -s ~/dotfiles/vim ~/.config/nvim
ln -s ~/dotfiles/git/gitignore ~/.gitignore
ln -s ~/dotfiles/git/gitconfig ~/.gitconfig
ln -s ~/dotfiles/zsh/aliases ~/.aliases
ln -s ~/dotfiles/zsh/zshrc ~/.zshrc
ln -s ~/dotfiles/tmux/tmux-osx.conf ~/.tmux.conf
ln -s ~/dotfiles/ssh/config ~/.ssh/config
