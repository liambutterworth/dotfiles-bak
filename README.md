# Dotfiles

A collection of configuration files for my dev setup.

## Vim

To get vim up and running make sure to have [Homebrew](https://brew.sh/) and
[vim-plug](https://github.com/junegunn/vim-plug) installed. Then:

```
  $ git clone https://github.com/wbbutterworth/dotfiles.git && cp dotfiles/{.zshrc,.tmux.conf,.vimrc} ~

  $ vim +PlugInstall +TmuxlineSnapshot\ .tmuxline +qall
```

Also grab [Powerline Fonts](https://github.com/powerline/fonts) for the special
airline characters.

#### Custom Maps

```jj``` for escape in insert mode

```,,``` toggle , at the end of the line in any mode  

```;;``` toggle ; at the end of the line in any mode  

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
