# Dotfiles

A collection of configuration files for my dev setup.

## Installation

First install [Homebrew](https://brew.sh),
[Prezto](https:/jk/github.com/sorin-ionescu/prezto), and [Vim
Plug](https://github.com/junegunn/vim-plug). Then, grab the [Powerline
Fonts](https://github.com/powerline/fonts). Now, tie everything together with:

```
  $ brew install vim tmux zsh zsh-completion

  $ git clone https://github.com/wbbutterworth/dotfiles.git && cd dotfiles

  $ cp dotfiles/{.vimrc,.tmux.conf,.zpreztorc} ~

  $ vim +PlugInstall +qall
```

## Tmux Maps

```
  <c-space>r reload tmux config file

  <c-space>s split window horizontally

  <c-space>v split window vertically

  <c-h> move to tmux or vim split to the left

  <c-j> move to tmux or vim split below

  <c-k> move to tmux or vim split above

  <c-l> move to tmux or vim split to the right
```

## Vim Maps

```
  ,, toggle , at the end of the line in any mode  

  ;; toggle ; at the end of the line in any mode  

  _ go to previous file; for exiting file browser

  Y yank to end of line; consistent with D and C

  <space> leader key  

  <leader><leader> input command

  <leader>gs git status  

  <leader>gl git log  

  <leader>ga git add 

  <leader>gd git diff  

  <leader>gb git blame  

  <leader>a= align block by =  

  <leader>a: align block by :  

  <leader>a" align block by "  

  <leader>s{ sort alphabetically inside {}  

  <leader>s} sort alphabetically inside {} globally  

```
