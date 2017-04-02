# Dotfiles

A collection of configuration files for my dev setup.

## Installation

Install [Homebrew](https://brew.sh):

```
  $ /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

Install [Oh My Zsh](https://github.com/robbyrussell/oh-my-zsh):

```
  $ sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

Install [Vim Plug](https://github.com/junegunn/vim-plug):

```
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

Now tie everything together:

```
  $ brew install vim tmux zsh zsh-completion

  $ git clone https://github.com/wbbutterworth/dotfiles.git && cp dotfiles/{.vimrc,.tmux.conf,.zshrc} ~

  $ vim +PlugInstall +TmuxlineSnapshot\ ~/.tmux/tmuxline +qall
```

Don't forget to grab the [Powerline Fonts](https://github.com/powerline/fonts).

## Vim Maps

```jj``` for escape in insert mode

```<c-a>h``` go to tmux pane on the left

```<c-a>j``` go to tmux pane above

```<c-a>k``` go to tmux pane below

```<c-a>l``` go to tmux pane on the right

```<space>``` leader key

```<space>fw``` file write

```<space>fW``` write file and quit

```<space>fq``` file quit

```<space>fQ``` file quit without write

```<space>gs``` git status

```<space>gl``` git log

```<space>ga``` git add

```<space>gd``` git diff

```<space>gb``` git blame

```<space>a=``` align block by =  

```<space>a:``` align block by :

```<space>a"``` align block by "

```<space>s{``` sort alphabetically inside {}

```<space>s}``` sort alphabetically inside {} globally  

```,,``` toggle , at the end of the line in any mode  

```;;``` toggle ; at the end of the line in any mode  

