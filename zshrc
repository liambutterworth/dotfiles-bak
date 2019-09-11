#
# Zsh Config
#
# :: Settings
# :: Aliases
# :: Plugins

#
# Settings
#

set -o ignoreeof

typeset -U path
typeset -U fpath

export ZSH_DOTDIR=$HOME/.zsh
export ZSH_SCRIPTS=$ZSH_DOTDIR/scripts
export ZPLUG_HOME=$ZSH_DOTDIR/plugs/zplug

fpath=($ZSH_SCRIPTS, $fpath)

autoload -Uz $ZSH_DOTDIR/scripts/*
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

#
# Plugins
#

source $ZPLUG_HOME/init.zsh

zplug 'zsh-users/zsh-completions'
zplug 'zsh-users/zsh-autosuggestions'
zplug 'zsh-users/zsh-history-substring-search'
zplug 'zsh-users/zsh-syntax-highlighting', defer:2
zplug 'junegunn/fzf', hook-build:'./install --bin'
zplug 'junegunn/fzf', use:'bin/{fzf,fzf-tmux}', as:command
zplug 'junegunn/fzf', use:'shell/*.zsh', defer:2
zplug 'BurntSushi/ripgrep', from:gh-r, as:command, use:'ripgrep'
zplug 'mafredri/zsh-async', from:github
zplug 'sindresorhus/pure', use:'pure.zsh', from:github, as:theme

zplug load

if zplug check 'zsh-users/zsh-history-substring-search'; then
    bindkey '^P' history-substring-search-up
    bindkey '^N' history-substring-search-down
fi

if zplug check 'junegunn/fzf'; then
    local fzf_color='bg+:0,pointer:4,info:4,border:0'
    local fzf_preview='(cat {} || ls -A {}) 2>/dev/null | head -200'
    export FZF_DEFAULT_OPTS="--color '$fzf_color'"
    export FZF_CTRL_T_OPTS="--preview '$fzf_preview'"
    export FZF_ALT_C_OPTS="--preview '$fzf_preview'"
    export FZF_TMUX=1
fi

if zplug check 'BurntSushi/ripgrep'; then
    alias rg='rg --hidden --follow --pretty'
    alias rgf='rg --files | rg'
    export FZF_DEFAULT_COMMAND='rg --files --hidden'
fi

if zplug check 'sindresorhus/pure'; then
    function preexec { print }
fi
