# Installation
- Install [Homebrew](https://github.com/Homebrew/brew)
- Install [vim-plug](https://github.com/junegunn/vim-plug)
- brew install git vim node ctags
- brew cask install iterm2 macvim
- vim +PlugInstall +qall
- cp ./.ctags ~/.ctags (run inside this root folder)
- cd ~/.vim/plugged/tern_for_vim && npm install
- cd ~/.vim/plugged/matchtag/ftplugin && cp xml.vim javascript.vim && cp xml.vim jsx.vim (run this for each filetype to include matchtag in)
- Download Powerline [fonts](https://github.com/powerline/fonts) (don't forget add under iterm>preferences>profile>[PROFILE]>text)
