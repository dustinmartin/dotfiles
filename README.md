# Dotfiles

## Prerequisites

Install the following before running the install script:

```
brew install fish starship zoxide ripgrep fzf neovim tmux fnm eza
```

Set Fish as the default shell:

```
chsh -s $(which fish)
```

Install a Nerd Font (required for icons):

```
brew install --cask font-jetbrains-mono-nerd-font
```

## Installation

```
git clone git://github.com/dustinmartin/dotfiles.git ~/dotfiles
cd ~/dotfiles
./install.sh
```

This will symlink the Fish config, git config, tmux config, Ghostty config, and Neovim config into the right places.

## SSH Key

Follow the instructions [here](https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/) to setup an SSH key.

## What's Included

- **fish/** - Fish shell config, aliases/abbreviations, and custom functions
- **vim/** - Neovim configuration (symlinked to `~/.config/nvim`)
- **git/** - Shared gitconfig and global gitignore
- **tmux/** - Tmux configuration
- **ghostty/** - Ghostty terminal configuration
- **bin/** - Custom scripts added to PATH
