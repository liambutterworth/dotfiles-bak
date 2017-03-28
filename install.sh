#!/bin/bash

# install oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# copy dotfiles to the home directory
cp dotfiles/{.zshrc,.gitconfig,.gitignore,.vimrc,.ctags,.tern-config,.eslint,.stylelint} ~

# install homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# install vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# install brew libraries
brew tap universal-ctags/universal-ctags
brew install --HEAD universal-ctags
brew cask install iterm2 macvim
brew install git vim node cmake

# install node libraries
npm i -g typescript eslint eslint-plugin-import eslint-config-airbnb eslint-plugin-jsx-a11y eslint-plugin-react stylelint stylelint-config-standard

# install vim libraries
vim +PlugInstall +qall

# setup git config
git config --global user.name "$1" && git config --global user.email "$2"

# install youcompleteme dependencies
cd ~/.vim/plugged/youcompleteme && ./install.py --tern-completer

# make matchtag work for javascript files
cd ~/.vim/plugged/matchtag/ftplugin && cp xml.vim javascript.vim
