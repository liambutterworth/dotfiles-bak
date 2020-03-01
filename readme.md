## Dotfiles

Packages: [Fish](https://github.com/fish-shell/fish-shell), [Git](https://github.com/git/git), [NeoVim](https://github.com/neovim/neovim), [Tmux](https://github.com/tmux/tmux)

### Mac

```
    $ git clone https://github.com/liambutterworth/dotfiles ~/.dotfiles
    $ ~/.dotfiles/bin/brew && ~/.dotfiles/bin/install
    $ echo $(which fish) >> /etc/shells && chsh -s $(which fish)
```
