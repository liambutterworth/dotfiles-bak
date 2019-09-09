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

export ZSH_DIR="$HOME/.zsh"
export ZPLUG_HOME=$ZSH_DIR/zplug

fpath=($ZSH_DIR/scripts $fpath)

autoload -Uz $ZSH_DIR/scripts/*
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
alias ll='ls -lhAGL --time-style=+'
alias tree='tree --dirsfirst -I ".git|vendor|node_modules"'
alias less='less --clear-screen --raw-control-chars'
alias rg='rg --hidden --follow --pretty'
alias rgf='rg --files | rg'

alias n='npm'
alias l='laravel'
alias c='composer'
alias a='php artisan'

alias v='vim'
alias vt='v -p'
alias vs='v -o'
alias vv='v -O'

alias t='tmux'
alias tn='t new -s'
alias ta='t attach-session -t'
alias tk='t kill-session -t'
alias tK='t kill-server'
alias tl='t list-sessions'
alias tc='clear && tmux clear-history'

alias d='docker'
alias db='d build'
alias dr='d run'
alias de='d exec'
alias dc='d container'
alias di='d image'
alias dn='d network'
alias dp='d system prune'
alias dl='d logs'
alias ds='d stop'
alias dps='d ps'
alias dli='docker-list-images'
alias dlc='docker-list-containers'
alias dln='d network ls'
alias dri='d rmi'
alias drc='d rm'
alias drn='d network rm'
alias d-c='docker-compose'
alias d-cu='d-c up'
alias d-cd='d-c down'
alias d-cb='d-c build'
alias d-cr='d-c run'
alias d-cub='d-c up --build'

alias g='git'
alias gcl='g clone'
alias ga='g add'
alias gmv='g mv'
alias grm='g rm'
alias gsh='g show'
alias gs='g status'
alias gb='g branch'
alias gco='g checkout'
alias gc='g commit'
alias gd='g diff'
alias gt='g tag'
alias gf='g fetch'
alias gst='g stash'
alias grl='g reflog'
alias gam='g ammend'
alias gau='g authors'
alias gch='g changed'
alias ge='g edits'
alias gi='g info'
alias gll='g log-long'
alias glg='g log-graph'
alias gr='cd $(git root)'
alias gss='g staged'
alias gun='g unstage'
alias gwh='g whoami'
alias gm='git merge'
alias gmt='g merge-test'

#
# Plugins
#

source $ZPLUG_HOME/init.zsh

zplug 'zsh-users/zsh-completions'
zplug 'zsh-users/zsh-autosuggestions'
zplug 'zsh-users/zsh-history-substring-search'
zplug 'zsh-users/zsh-syntax-highlighting', defer:2
zplug 'junegunn/fzf', hook-build: './install --bin'
zplug 'junegunn/fzf', use:'bin/{fzf,fzf-tmux}', as:command
zplug 'junegunn/fzf', use:'shell/*.zsh', defer:2

zplug load

if zplug check 'zsh-users/zsh-history-substring-search'; then
    bindkey '^P' history-substring-search-up
    bindkey '^N' history-substring-search-down
fi

if zplug check 'junegunn/fzf'; then
    local fzf_color='bg+:0,pointer:4,info:4,border:0'
    local fzf_preview='(cat {} || ls -A {}) 2>/dev/null | head -200'

    export FZF_DEFAULT_COMMAND='rg --files --hidden'
    export FZF_DEFAULT_OPTS="--color '$fzf_color'"
    export FZF_CTRL_T_OPTS="--preview '$fzf_preview'"
    export FZF_ALT_C_OPTS="--preview '$fzf_preview'"
    export FZF_TMUX=1
fi
