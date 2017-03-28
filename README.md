# Setup

- Install [Docker](https://docs.docker.com/docker-for-mac/install)
- Install [Homebrew](https://github.com/Homebrew/brew)
- Install [vim-plug](https://github.com/junegunn/vim-plug)
- Install [Oh My Zsh](https://github.com/robbyrussell/oh-my-zsh)
- Install [Universal Ctags](https://github.com/universal-ctags/ctags)
- Install [Powerline Fonts](https://github.com/powerline/fonts) (change font in iterm; preferences>profile>Default>text)

```
 $ git clone https://github.com/wbbutterworth/vimrc.git

 $ cp dotfiles/{.zshrc,.gitconfig,.gitignore,.vimrc,.ctags,.tern-config,.eslint,.stylelint} ~

 $ brew cask install iterm2 macvim

 $ brew install git vim node cmake

 $ npm i -g typescript

 $ vim +PlugInstall +qall

 $ cd ~/.vim/plugged/youcompleteme && ./install.py --tern-completer

 $ cd ~/.vim/plugged/matchtag/ftplugin && cp xml.vim javascript.vim
```

## Vim Mappings

```<c-e>``` Emmet leader key

```<c-e><cr>``` Meant to expand tags; set in the context of Emmet

```<c-x>``` UltiSnips leader key; follows emmet convention of ```<c-x>```, ```<c-x>n``` and ```<c-x>N```

```,l``` toggle invisible characters: spaces, tabs and cr  

```,h``` toggle search highlighting  

```,,``` toggle , at the end of the line in any mode  

```,;``` toggle ; at the end of the line in any mode  

```,cc``` manual syntax check  

```,ct``` toggle syntax checking  

```,a=``` align block by =  

```,a:``` align block by : (uses space after : as delimeter)  

```,a"``` align block by " (useful for vim-style comments)  
