# Installation

- Install [Homebrew](https://github.com/Homebrew/brew)
- Install [vim-plug](https://github.com/junegunn/vim-plug)
- Install [Oh My Zsh](https://github.com/robbyrussell/oh-my-zsh)
- Install [Universal Ctags](https://github.com/universal-ctags/ctags)
- Install [Powerline Fonts](https://github.com/powerline/fonts) (change font in iterm; preferences>profile>Default>text)

```

 $ git clone https://github.com/wbbutterworth/vimrc.git

 $ cp vimrc/.vimrc ~/.vimrc && cp vimrc/.ctags ~/.ctags

 $ brew install git vim node

 $ brew cask install iterm2 macvim

 $ vim +PlugInstall +qall

 $ cd ~/.vim/plugged/tern_for_vim && npm install

 $ cd ~/.vim/plugged/matchtag/ftplugin && cp xml.vim javascript.vim && cp xml.vim jsx.vim (copy for each filetype matchtag should highlight in)

```

# Mappings

```,l``` toggle invisible characters: spaces, tabs and cr  
```,h``` toggle search highlighting  
```,,``` toggle , at the end of the line in any mode  
```,;``` toggle ; at the end of the line in any mode  
```,c``` toggle syntax checking  
```,a=``` align block by =  
```,a:``` align block by : (uses space after : as delimeter)  
