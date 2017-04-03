# Dotfiles

A collection of configuration files for my development environment.

## Setup

First install [Homebrew](https://brew.sh),
[Prezto](https://github.com/sorin-ionescu/prezto), and [Vim
Plug](https://github.com/junegunn/vim-plug). Then, grab the [Powerline
Fonts](https://github.com/powerline/fonts). Now, tie everything together with:

```
  $ brew install zsh zsh-completion vim tmux

  $ git clone https://github.com/wbbutterworth/dotfiles.git && cp dotfiles/{.zpreztorc,.vimrc,.tmux.conf} ~

  $ vim +PlugInstall +TmuxlineSnapshot\ ~/.tmux/tmuxline +qall
```

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

