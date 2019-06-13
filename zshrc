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

export CACHE="$HOME/.cache/zsh"
export PLUGINS="$HOME/.zsh/plugins"
export SCRIPTS="$HOME/.zsh/scripts"

fpath=($CACHE $fpath)
fpath=($SCRIPTS $fpath)

autoload -Uz $SCRIPTS/*
autoload -Uz compinit && compinit -d "$CACHE/zcompdump"
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
alias less='less --raw-control-chars'
alias grep='grep --color=always'
alias tree='tree -I ".git|vendor|node_modules"'
alias rg='rg --hidden'

alias ts='tmux new -s'
alias ta='tmux attach-session -t'
alias tk='tmux kill-session -t'
alias tK='tmux kill-server'
alias tl='tmux list-sessions'
alias tn='tmux rename-session'
alias tc='clear && tmux clear-history'

alias gcl='git clone'
alias ga='git add'
alias gmv='git mv'
alias grm='git rm'
alias gsh='git show'
alias gs='git status'
alias gb='git branch'
alias gco='git checkout'
alias gc='git commit'
alias gd='git diff'
alias gt='git tag'
alias gf='git fetch'
alias gst='git stash'
alias grl='git reflog'
alias gam='git ammend'
alias gau='git authors'
alias gch='git changed'
alias ge='git edits'
alias gi='git info'
alias gll='git log-long'
alias glg='git log-graph'
alias gr='cd $(git root)'
alias gss='git staged'
alias gun='git unstage'
alias gwh='git whoami'
alias gsa='git submodule add'
alias gsr='git-submodule-remove'

alias db='docker build'
alias dr='docker run'
alias de='docker exec'
alias dc='docker container'
alias di='docker image'
alias dp='docker system prune'
alias dl='docker logs'
alias dli='docker-list-images'
alias dlc='docker-list-containers'
alias dln='docker network ls'
alias dri='docker rmi'
alias drc='docker rm'
alias drn='docker network rm'
alias d-cu='docker-compose up'
alias d-cd='docker-compose down'
alias d-cb='docker-compose build'
alias d-cr='docker-compose run'

#
# Plugins
#

if plugin-exists 'zsh-completions'; then
    fpath=("$PLUGINS/zsh-completions/src" $fpath)
    compinit -d "$CACHE/zcompdump"
fi

if plugin-exists 'zsh-autosuggestions'; then
    source "$PLUGINS/zsh-autosuggestions/zsh-autosuggestions.zsh"
    export ZSH_AUTOSUGGEST_ACCEPT_WIDGETS=(foward-char end-of-line)
fi

if plugin-exists 'zsh-history-substring-search'; then
    source "$PLUGINS/zsh-history-substring-search/zsh-history-substring-search.zsh"
    bindkey '^P' history-substring-search-up
    bindkey '^N' history-substring-search-down
fi

if plugin-exists 'zsh-syntax-highlighting'; then
    source "$PLUGINS/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
fi

if plugin-exists 'nord-dircolors'; then
    eval "$(dircolors -b $PLUGINS/nord-dircolors/src/dir_colors)"
    zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
fi

if plugin-exists 'fzf'; then
    bindkey '^E' fzf-cd-widget

    source "$PLUGINS/fzf/shell/completion.zsh"
    source "$PLUGINS/fzf/shell/key-bindings.zsh"

    local fzf_color='bg+:0,pointer:4,info:4,border:0'
    local fzf_bind='ctrl-d:preview-page-down,ctrl-u:preview-page-up'
    local fzf_preview='(cat {} || ls -A {}) 2>/dev/null | head -200'

    export FZF_DEFAULT_COMMAND='rg --files'
    export FZF_DEFAULT_OPTS="--color '$fzf_color' --bind '$fzf_bind'"
    export FZF_CTRL_T_OPTS="--preview '$fzf_preview'"
    export FZF_ALT_C_OPTS="--preview '$fzf_preview'"
    export FZF_TMUX=1

    fpath=("$PLUGINS/fzf/bin" $fpath)
fi
