#!/bin/bash

# copy config files to home directory
# cp ./{.zshrc,.vimrc,.tmuxrc} ~
cp ./{.vimrc,.tmuxrc} ~

# install vim-plug and plugins
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +PlugInstall +qall

# install zplug and plugins
# curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh| zsh || true
# zplug install
