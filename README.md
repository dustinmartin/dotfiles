# Dotfiles

## Prerequisites

Install the following before running the install script:

### Fish Shell

```
sudo apt-add-repository ppa:fish-shell/release-3
sudo apt update
sudo apt install fish
```

Set Fish as the default shell:

```
chsh -s $(which fish)
```

### Starship Prompt

```
curl -sS https://starship.rs/install.sh | sh
```

### Zoxide

```
curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh
```

### Neovim

```
sudo apt install neovim
```

## Installation

```
git clone git://github.com/dustinmartin/dotfiles.git ~/dotfiles
cd ~/dotfiles
./install.sh
```

This will symlink the Fish config, git config, tmux config, and Neovim config into the right places.

## SSH Key

Follow the instructions [here](https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/) to setup an SSH key.

## What's Included

- **fish/** - Fish shell config, aliases/abbreviations, and custom functions
- **vim/** - Neovim configuration (symlinked to `~/.config/nvim`)
- **git/** - Shared gitconfig and global gitignore
- **tmux/** - Tmux configuration
- **bin/** - Custom scripts added to PATH
- **zsh/** - Legacy Zsh config
