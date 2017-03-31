#!/bin/bash

# copy dotfiles to the home directory
cp dotfiles/{.vimrc,.ctags,.tern-config,.eslintrc,.stylelintrc,.proselintrc} ~

# install brew libraries
brew tap caskroom/versions
brew install --HEAD universal-ctags
brew cask install iterm2 macvim
brew install git vim node tree

# install node libraries
npm i -g eslint eslint-plugin-import eslint-config-airbnb eslint-plugin-jsx-a11y eslint-plugin-react stylelint stylelint-config-standard

# install python libraries
pip install proselint

# setup vim dependencies
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
curl -fo ~/.vim/thesaurus/mthesaur.txt --create-dirs https://raw.githubusercontent.com/zeke/moby/master/words.txt
vim +PlugInstall +qall
cd ~/.vim/plugged/matchtag/ftplugin && cp xml.vim javascript.vim
cd ~/.vim/plugged/youcompleteme && ./install.py --tern-completer
