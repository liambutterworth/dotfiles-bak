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
export ZSH_CACHE=$HOME/.cache/zsh
export ZSH_SCRIPTS=$ZSH_DOTDIR/scripts
export ZPLUG_HOME=$ZSH_DOTDIR/zplug

fpath=($ZSH_CACHE, $ZSH_SCRIPTS, $fpath)

autoload -Uz $ZSH_DOTDIR/scripts/*
autoload -Uz compinit && compinit -d $ZSH_CACHE/zcompdump
autoload -Uz edit-command-line
autoload -Uz vcs_info

bindkey -v
bindkey '^w' backward-kill-word
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^[[Z' reverse-menu-complete

function zle-keymap-select zle-line-init { set-prompt }
function precmd { print; vcs_info }
function preexec { print }

zle -N zle-keymap-select
zle -N zle-line-init

zstyle ':completion:*' menu select
zstyle ':completion:*' list-dirs-first true
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' completer _complete _correct _ignored _approximate
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr '*'
zstyle ':vcs_info:*' stagedstr '*'
zstyle ':vcs_info:*' formats '%b%c%u'

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
    export FZF_DEFAULT_COMMAND='rg --files --hidden'
    alias rg='rg --hidden --follow --pretty'
    alias rgf='rg --files | rg'
fi
