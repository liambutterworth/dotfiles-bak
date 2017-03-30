## Setup

Install [Oh My Zsh](https://github.com/robbyrussell/oh-my-zsh), [Homebrew](https://brew.sh) and [Powerline Fonts](https://github.com/powerline/fonts). Don't forget to select the fonts in iterm (Preferences > Profiles > PROFILE > Text). Then run the command below: (name and email are for git)

```
 $ git clone https://github.com/wbbutterworth/vimrc.git && dotfiles/install.sh "NAME" "EMAIL"
```

# Vim

```<c-e>,``` expand text with emmet

```<c-e><cr>``` meant to expand tags; set in the context of Emmet  

```<c-x>,``` expand text with ultisnips

```<c-e>n``` next ultisnips placeholder  

```<c-e>N``` previous ultisnips placeholder  

```_``` exit out to last file inside netrw  

```<space>i``` toggle invisible characters: spaces, tabs and cr  

```<space>h``` toggle search highlighting  

```<space>s``` sort alphabetically inside {} (useful for css)  

```<space>S``` sort alphabetically inside {} globally  

```<space>a=``` align block by =  

```<space>a:``` align block by : (uses space after : as delimeter)  

```<space>a"``` align block by " (useful for vim-style comments)  

```,,``` toggle , at the end of the line in any mode  

```;;``` toggle ; at the end of the line in any mode  

