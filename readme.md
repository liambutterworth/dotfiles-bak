# Dotfiles

Packages: [ctags](https://github.com/universal-ctags/ctags), [fish](https://github.com/fish-shell/fish-shell), [git](https://github.com/git/git), [neovim](https://github.com/neovim/neovim), [tmux](https://github.com/tmux/tmux)

## Mac

- Setup iTerm
- Install [devicons](https://github.com/ryanoasis/vim-devicons) font
- Run commands:

```
    $ git clone https://github.com/liambutterworth/dotfiles ~/.dotfiles
    $ ~/.dotfiles/bin/brew && ~/.dotfiles/bin/install
    $ echo $(which fish) >> /etc/shells && chsh -s $(which fish)
```
