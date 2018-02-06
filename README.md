## Installation

Install vim git tmux and zsh with whatever package manager. Then run:

```
$ git clone http://github.com/wbbutterworth/dotfiles.git ~/.dotfiles

$ ~/.dotfiles/bin/install

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
  <space> leader key

	<leader><leader> FZF Find Files

  Y yank to end of line; consistent with D and C

  ,, toggle , at the end of the line in any mode
  ;; toggle ; at the end of the line in any mode

	<c-x><c-k> FZF Complete Word
	<c-x><c-f> FZF Complete Path
	<c-x><c-j> FZF Complete File
	<c-x><c-l> FZF Complete Line

  <leader>gl git log
  <leader>gs git status
  <leader>ga git add
  <leader>gd git diff
  <leader>gb git blame

	[h Highlight Search
	]h Unhighlight Search
	[l Show Invisible Characters
	]l Hide Invisible Characters
	[a Enable Linters
	]a Disable Linters
```
