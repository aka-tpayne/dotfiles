install:	install-vim install-tmux \
					install-git install-ctags \
					install-ssh install-bash

install-vim:
	rm -rf ~/.vimrc
	ln -s `pwd`/vimrc ~/.vimrc

install-tmux:
	rm -rf ~/.tmux.conf
	ln -s `pwd`/tmux.conf ~/.tmux.conf

install-git:
	rm -rf ~/.gitconfig ~/.gitignore
	ln -s `pwd`/gitconfig ~/.gitconfig
	ln -s `pwd`/gitignore ~/.gitignore

install-ctags:
	rm -rf ~/.ctags
	ln -s `pwd`/ctags ~/.ctags

install-ssh:
	rm -rf ~/.ssh/config
	ln -s `pwd`/ssh_config ~/.ssh/config

install-bash:
	rm -rf ~/.bashrc
	ln -s `pwd`/bashrc ~/.bashrc
ifeq ($(shell uname), Darwin)
	rm -rf ~/.bash_profile
	ln -s `pwd`/bash_profile ~/.bash_profile
endif
