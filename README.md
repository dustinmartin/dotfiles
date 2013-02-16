#Read Me

##Installation:

    git clone git://github.com/dustinmartin/dotfiles.git ~/dotfiles

##Create symlinks:

    ln -s ~/Config/vim/vimrc ~/.vimrc
    ln -s ~/Config/vim ~/.vim
    ln -s ~/Config/git/gitignore ~/.gitignore
	ln -s ~/Config/git/gitconfig ~/.gitconfig
	ln -s ~/Config/zsh/aliases ~/.aliases
	ln -s ~/Config/zsh/zshrc ~/.zshrc
	ln -s ~/Config/zsh/oh-my-zsh/themes/dustin.zsh-theme ~/.oh-my-zsh/themes/dustin.zsh-theme

##Switch to the `~/Config` directory, and fetch submodules:

    cd ~/Config
    git submodule init
    git submodule update

##To update all the plugins run the following git command:

	git submodule foreach git pull origin master
