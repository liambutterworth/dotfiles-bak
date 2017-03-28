# Setup

Run the command below to clone and install all dependencies. The name and email params are for git. Don't forget to install the [powerline fonts](https://github.com/powerline/fonts) and select them in iterm (Preferences > Profiles > PROFILE > Text)

```
 $ git clone https://github.com/wbbutterworth/vimrc.git && cd dotfiles && install.sh "NAME" "EMAIL"
```

## Vim Mappings

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
