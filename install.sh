#!/bin/bash

# copy config files to home directory
# cp ./{.zshrc,.vimrc,.tmuxrc} ~
cp ./{.zshrc,.vimrc,.tmux.conf} ~

# install vim-plug and plugins
# curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# vim +PlugInstall +qall

# install antigen and plugins
# mkdir -p ~/.zsh && curl -L git.io/antigen > ~/.zsh/antigen.zsh

# install zplug and plugins
# curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh| zsh || true
# curl -fLo ~/.zplug --create-dirs https://raw.githubusercontent.com/zplug/
# mkdir -p ~/.zplug && git clone https://github.com/zplug/zplug ~/.zplug
export ZPLUG_HOME=~/.zplug
git clone https://github.com/zplug/zplug $ZPLUG_HOME
zplug install
