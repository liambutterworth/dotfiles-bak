## Setup

Install [Oh My Zsh](https://github.com/robbyrussell/oh-my-zsh), [Homebrew](https://brew.sh) and [Powerline Fonts](https://github.com/powerline/fonts). Don't forget to select the fonts in iterm (Preferences > Profiles > PROFILE > Text). Then run the command below: (name and email are for git)

```
 $ git clone https://github.com/wbbutterworth/vimrc.git && cd dotfiles && install.sh "NAME" "EMAIL"
```

# Vim

```<space><space>``` enter command

```<space>p``` convenience map for CtrlP

```<c-e>``` emmet leader key  

```<c-e>j``` next emment placeholder  

```<c-e>k``` previous emmet placeholder  

```<c-e><cr>``` meant to expand tags; set in the context of Emmet  

```<space>_``` exit out to last file inside netrw  

```<space>]``` go to tag definition  

```<space>[``` go back through tag definition chain  

```<space>w``` convenience map for ```<c-w>```  

```<space>h``` go to split on the left

```<space>j``` go to split below

```<space>k``` move to split above

```<space>l``` move to on the right

```<space>i``` toggle invisible characters: spaces, tabs and cr  

```<space>h``` toggle search highlighting  

```<space>s``` sort alphabetically inside {} (useful for css)  

```<space>S``` sort alphabetically inside {} globally  

```<space>a=``` align block by =  

```<space>a:``` align block by : (uses space after : as delimeter)  

```<space>a"``` align block by " (useful for vim-style comments)  

```,,``` toggle , at the end of the line in any mode  

```;;``` toggle ; at the end of the line in any mode  

