#!/bin/bash

# copy dotfiles to the home directory
cp dotfiles/{.zshrc,.gitconfig,.gitignore,.vimrc,.ctags,.tern-config,.eslintrc,.stylelintrc,.proselintrc} ~

# install brew libraries
brew tap caskroom/versions
brew install --HEAD universal-ctags
brew cask install iterm2-beta
brew cask install macvim --with-lua
brew install git node tree
brew install vim --with-lua

# install node libraries
npm i -g typescript eslint eslint-plugin-import eslint-config-airbnb eslint-plugin-jsx-a11y eslint-plugin-react stylelint stylelint-config-standard

# install python libraries
pip install proselint

# setup git config
git config --global user.name $1 && git config --global user.email $2

# setup vim dependencies
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +PlugInstall +qall
cd ~/.vim/plugged/matchtag/ftplugin && cp xml.vim javascript.vim
