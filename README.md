# Dotfiles

## Prerequisites

- [Homebrew](https://brew.sh/)

## Installation

```
git clone git://github.com/dustinmartin/dotfiles.git ~/dotfiles
cd ~/dotfiles
./install.sh
```

The install script uses Homebrew to install the required packages and casks, then symlinks the Fish config, git config, tmux config, Ghostty config, and Neovim config into the right places. Optional steps such as cask installs or switching the default shell will warn and continue if they fail.

## SSH Key

Follow the instructions [here](https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/) to setup an SSH key.

## What's Included

- **fish/** - Fish shell config, aliases/abbreviations, and custom functions
- **vim/** - Neovim configuration (symlinked to `~/.config/nvim`)
- **git/** - Shared gitconfig and global gitignore
- **tmux/** - Tmux configuration
- **ghostty/** - Ghostty terminal configuration
- **bin/** - Custom scripts added to PATH
