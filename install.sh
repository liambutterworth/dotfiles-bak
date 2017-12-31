#!/bin/bash

# copy config files to home directory
cp ./{.zshrc,.vimrc,.tmux.conf,.tmux.conf} ~

# install vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# install zplug
curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh| zsh

# install vim plugins
vim +PlugInstall +qall

# install zsh plugins
zplug install
