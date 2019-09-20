#
# Zsh Config
#
# :: Settings
# :: Aliases
# :: Plugins

#
# Settings
#

typeset -U path
typeset -U fpath

autoload -Uz compinit && compinit
autoload -Uz edit-command-line

bindkey -v
bindkey '^w' backward-kill-word
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^[[Z' reverse-menu-complete

zstyle ':completion:*' menu select
zstyle ':completion:*' list-dirs-first true
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' completer _complete _correct _ignored _approximate

#
# Aliases
#

alias ls='ls --color=auto --group-directories-first'
alias less='less --clear-screen --raw-control-chars'
alias grep='grep --color=auto'

alias c='clear'
alias g='git'
alias t='tmux'
alias v='vim'
alias d='docker'
alias dc='docker-compose'
alias so='source'
alias art='php artisan'
alias comp='composer'
alias fuck='sudo !!'

#
# Plugins
#

source ~/.zplug/init.zsh

zplug 'BurntSushi/ripgrep', from:gh-r, as:command, rename-to:'rg'
zplug 'sharkdp/fd', from:gh-r, as:command, rename-to:'fd'
zplug 'junegunn/fzf', hook-build:'./install --bin'
zplug 'junegunn/fzf', use:'bin/{fzf,fzf-tmux}', as:command
zplug 'junegunn/fzf', use:'shell/*.zsh', defer:2
zplug 'mafredri/zsh-async', from:github
zplug 'sindresorhus/pure', use:'pure.zsh', from:github, as:theme
zplug 'zsh-users/zsh-autosuggestions'
zplug 'zsh-users/zsh-completions'
zplug 'zsh-users/zsh-history-substring-search'
zplug 'zsh-users/zsh-syntax-highlighting', defer:2

zplug load

if zplug check 'BurntSushi/ripgrep'; then
    alias rg='rg --hidden --follow --pretty'
fi

if zplug check 'sharkdp/fd'; then
    _fzf_compgen_path() { fd --hidden --folow --exclude '.git' . "$1" }
    _fzf_compgen_dir() { fd --type d --hidden --folow --exclude '.git' . "$1" }
    export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow'
fi

if zplug check 'junegunn/fzf'; then
    bindkey ^g fzf-cd-widget
    local fzf_color_opt="--color 'bg+:0,pointer:4,info:4,border:0'"
    local fzf_preview_opt="--preview '(cat {} || ls -A {}) 2>/dev/null | head -200'"
    export FZF_DEFAULT_OPTS="$fzf_color_opt $fzf_preview_opt"
fi

if zplug check 'sindresorhus/pure'; then
    zstyle ':prompt:pure:git:branch' color 8
    zstyle ':prompt:pure:host' color 8
    zstyle ':prompt:pure:user' color 8
    function preexec { print }
fi

if zplug check 'zsh-users/zsh-history-substring-search'; then
    bindkey '^P' history-substring-search-up
    bindkey '^N' history-substring-search-down
fi
