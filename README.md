# Dotfiles

## Prerequisites

- [Homebrew](https://brew.sh/)

## Installation

```
git clone git://github.com/dustinmartin/dotfiles.git ~/dotfiles
cd ~/dotfiles
./install.sh
```

The install script installs the required Homebrew packages and casks, sets Fish as the default shell, and symlinks the Fish config, git config, tmux config, Ghostty config, and Neovim config into the right places.

## SSH Key

Follow the instructions [here](https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/) to setup an SSH key.

## What's Included

- **fish/** - Fish shell config, aliases/abbreviations, and custom functions
- **vim/** - Neovim configuration (symlinked to `~/.config/nvim`)
- **git/** - Shared gitconfig and global gitignore
- **tmux/** - Tmux configuration
- **ghostty/** - Ghostty terminal configuration
- **bin/** - Custom scripts added to PATH
