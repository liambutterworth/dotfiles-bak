## Installation

First install [Homebrew](https://brew.sh), [Vim Plug](https://github.com/junegunn/vim-plug), [zPlug](https://github.com/zplug/zplug), and [Adobe Source Code Pro](https://github.com/adobe-fonts/source-code-pro). Then run:

```
$ brew install vim git tmux zsh

$ git clone https://github.com/wbbutterworth/dotfiles.git && cd dotfiles

$ cp dotfiles/{.vimrc,.zshrc,.tmux.conf,.tmuxline} ~

$ vim +PlugInstall +qall

$ zplug install
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

	<leader><leader> FZF Find Files

	<c-x><c-k> FZF Complete Word
	<c-x><c-f> FZF Complete Path
	<c-x><c-j> FZF Complete File
	<c-x><c-l> FZF Complete Line

  <leader>gs git status
  <leader>gl git log
  <leader>ga git add
  <leader>gd git diff
  <leader>gb git blame

	[h Highlight Search
	]h Unhighlight Search

	[l Show Invisible Characters
	]l Hide Invisible Characters

	[a Lint File
	]a Don't Lint File
```
