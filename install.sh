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
ln -s ~/dotfiles/ssh/config ~/.ssh/config

cat <<EOF > ~/.gitignore
[user]
  email = <EMAIL HERE>
[include]
  path = ~/dotfiles/git/gitconfig
EOF

cat <<EOF > ~/.zshrc
source ~/dotfiles/zsh/zshrc
EOF

cat <<EOF > ~/.tmux.conf
source ~/dotfiles/tmux/tmux.conf
EOF

