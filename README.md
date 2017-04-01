# Dotfiles

A collection of configuration files for my dev setup.

## Vim

To get vim up and running make sure to have [Homebrew](https://brew.sh/) and
[vim-plug](https://github.com/junegunn/vim-plug) installed. Then:

```
  $ git clone https://github.com/wbbutterworth/dotfiles.git ~/Downloads

  $ cp ~/Downloads/dotfiles/{.vimrc,.ctags,.tern-config,.eslintrc,.stylelintrc,proselintrc} ~

  $ brew install vim && brew cask install macvim

  $ vim +PlugInstall +qall
```

Also grab a font for the airline special characters ([Powerline
Fonts](https://github.com/powerline/fonts) or [Source Code
Pro](https://github.com/adobe-fonts/source-code-pro)).

#### Custom Maps

```<space>``` is the leader key.

```<space>s``` sort alphabetically inside {} (useful for css)  

```<space>S``` sort alphabetically inside {} globally  

```<space>a=``` align block by =  

```<space>a:``` align block by : (uses space after : as delimeter)  

```<space>a"``` align block by " (useful for vim-style comments)  

```_``` exit out to last file inside netrw  

```,,``` toggle , at the end of the line in any mode  

```;;``` toggle ; at the end of the line in any mode  
