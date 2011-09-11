#Read Me

##Installation:

    git clone git://github.com/dustinmartin/dotfiles.git ~/dotfiles

##Create symlinks:

    ln -s ~/dotfiles/vim/vimrc ~/.vimrc
    ln -s ~/dotfiles/vim ~/.vim
    ln -s ~/dotfiles/git/gitignore ~/.gitignore
	ln -s ~/dotfiles/git/gitconfig ~/.gitconfig
	ln -s ~/dotfiles/terminal/bash_profile ~/.bash_profile
	ln -s ~/dotfiles/terminal/bash_prompt ~/.bash_prompt
	ln -s ~/dotfiles/terminal/aliases ~/.aliases
	ln -s ~/dotfiles/terminal/exports ~/.exports
	ln -s ~/dotfiles/terminal/inputrc ~/.inputrc

##Switch to the `~/dotfiles` directory, and fetch submodules:

    cd ~/dotfiles
    git submodule init
    git submodule update

##To update all the plugins run the following git command:

	git submodule foreach git pull origin master
