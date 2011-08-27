#Read Me

##Installation:

    git clone git://github.com/dustinmartin/dotfiles.git ~/dotfiles

##Create symlinks:
    
    ln -s ~/dotfiles/vim/vimrc ~/.vimrc
    ln -s ~/dotfiles/vim ~/.vim
    ln -s ~/dotfiles/git/gitignore ~/.gitignore

##Setup Git configuration

    git config --global core.excludesfile ~/.gitignore

##Switch to the `~/dotfiles` directory, and fetch submodules:

    cd ~/dotfiles
    git submodule init
    git submodule update

##To update all the plugins run the following git command:

	git submodule foreach git pull origin master
