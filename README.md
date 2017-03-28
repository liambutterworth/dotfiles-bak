# Setup

- Install [Homebrew](https://brew.sh)
- Install [Oh My Zsh](https://github.com/robbyrussell/oh-my-zsh)
- Install [Powerline Fonts](https://github.com/powerline/fonts) don't forget to select them in iterm (Preferences > Profiles > PROFILE > Text)

Now run the command below: (the name and email arugments are for git)

```
 $ git clone https://github.com/wbbutterworth/vimrc.git && cd dotfiles && install.sh "NAME" "EMAIL"
```

# Vim

```<c-e>``` Emmet leader key

```<c-e><cr>``` Meant to expand tags; set in the context of Emmet

```<c-x>``` UltiSnips leader key; follows emmet convention of ```<c-x>```, ```<c-x>n``` and ```<c-x>N```

```_``` exit out to last file inside netrw

```,l``` toggle invisible characters: spaces, tabs and cr  

```,h``` toggle search highlighting  

```,s``` sort alphabetically inside {} (useful for css)

```,S``` sort alphabetically inside {} globally

```,,``` toggle , at the end of the line in any mode  

```,;``` toggle ; at the end of the line in any mode  

```,cc``` manual syntax check  

```,ct``` toggle syntax checking  

```,a=``` align block by =  

```,a:``` align block by : (uses space after : as delimeter)  

```,a"``` align block by " (useful for vim-style comments)  
