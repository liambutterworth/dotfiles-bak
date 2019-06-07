#
# Zsh Config
#
# :: Settings
# :: Functions
# :: Aliases
# :: Plugins
# :: Init

#
# Settings
#

export DOTFILES="$HOME/.dotfiles"
export CACHE="$HOME/.cache"
export PLUGINS="$DOTFILES/plugins"
export VIM_CACHE="$CACHE/vim"
export VIM_PLUGINS="$PLUGINS/vim"
export ZSH_CACHE="$CACHE/zsh"
export ZSH_PLUGINS="$PLUGINS/zsh"

autoload -Uz compinit
autoload -Uz vcs_info
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
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr '*'
zstyle ':vcs_info:*' stagedstr '*'
zstyle ':vcs_info:*' formats '%b%c%u'

zle -N zle-line-init
zle -N zle-keymap-select

function zle-line-init { set-prompt; zle reset-prompt }
function zle-keymap-select { set-prompt; zle reset-prompt }
function precmd { print; vcs_info }
function preexec { print }

#
# Functions
#

function set-prompt {
    PROMPT='%F{4}%3~%F{8}'
    [[ -n $vcs_info_msg_0_ ]] && PROMPT+=" ${vcs_info_msg_0_}"
    [[ -n $SSH_CLIENT ]] || [[ -n $SSH_TTY ]] && PROMPT+=' %n@%M'
    PROMPT+=$'\n''%(?.%F{5}.%F{1})'
    [[ $KEYMAP = 'vicmd' ]] && PROMPT+='❮' || PROMPT+='❯'
    PROMPT+='%F{7} '
}

function add-to-path {
    if [[ $PATH != *$1* ]]; then
        export PATH="$PATH:$1"
    fi
}

function add-to-fpath {
    if [[ $fpath != *$1* ]]; then
        fpath=($1 $fpath)
    fi
}

#
# Aliases
#

# GNU

alias ls='ls --color=auto --group-directories-first'
alias grep='grep --color=always --exclude-dir=.git --exclude-dir=vendor --exclude-dir=node_modules'
alias less='less --raw-control-chars'

# Tmux

alias ts='tmux new -s'
alias ta='tmux attach-session -t'
alias tk='tmux kill-session -t'
alias tl='tmux list-sessions'
alias tn='tmux rename-session'
alias tc='clear && tmux clear-history'

# Git

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

# Docker

local docker_container_format='{{.ID}}\t{{.Image}}\t{{.Names}}\t{{.Status}}'
local docker_image_format='{{.ID}}\t{{.Repository}}\t{{.Tag}}\t{{.CreatedAt}}'

alias db='docker build'
alias dr='docker run'
alias de='docker exec'
alias dc='docker container'
alias di='docker image'
alias dp='docker system prune'
alias dl='docker logs'
alias dlc="docker container ls --all --format='table $docker_container_format'"
alias dli="docker image ls --all --format='table $docker_image_format'"
alias dqc='docker container ls -aq'
alias dqi='docker image ls -aq'
alias drc='docker rm'
alias d-cu='docker-compose up'
alias d-cd='docker-compose down'
alias d-cb='docker-compose build'
alias d-cr='docker-compose run'

#
# Plugins
#

function register-plugin {
    local path_to_plugin="$ZSH_PLUGINS/$1"

    if [[ -f $path_to_plugin ]]; then
        source $path_to_plugin
    elif [[ -d $path_to_plugin ]]; then
        add-to-fpath $path_to_plugin
    fi
}

# TODO write plugin exists function; create string for managed plugins to search?

# Completions

register-plugin 'zsh-completions/src'

# local completions_dir="$ZSH_PLUGINS/zsh-completions/src"

# if [[ -d $completions_dir ]]; then
#     add-to-fpath $completions_dir
# fi

# Autosuggestions

register-plugin 'zsh-autosuggestions/zsh-autosuggestions.zsh'

export ZSH_AUTOSUGGEST_ACCEPT_WIDGETS=(forward-char end-of-line)

# local autosuggestions_file="$ZSH_PLUGINS/zsh-autosuggestions/zsh-autosuggestions.zsh"

# if [[ -f $autosuggestions_file ]]; then
#     source $autosuggestions_file
#     export ZSH_AUTOSUGGEST_ACCEPT_WIDGETS=(forward-char end-of-line)
# fi

# History Substring Search

register-plugin 'zsh-history-substring-search/zsh-history-substring-search.zsh'

bindkey '^P' history-substring-search-up
bindkey '^N' history-substring-search-down

# local history_substring_search_file="$ZSH_PLUGINS/zsh-history-substring-search/zsh-history-substring-search.zsh"

# if [[ -f $history_substring_search_file ]]; then
#     source $history_substring_search_file
#     bindkey '^P' history-substring-search-up
#     bindkey '^N' history-substring-search-down
# fi

# Syntax Highlighting

register-plugin 'zsh-syntax-highlighting/zsh-syntax-highlighting.zsh'

# local syntax_highlighting_file="$ZSH_PLUGINS/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

# if [[ -f $syntax_highlighting_file ]]; then
#     source $syntax_highlighting_file
# fi

# FZF

local fzf_dir="$ZSH_PLUGINS/fzf"

if [[ -f "$fzf_dir/bin/fzf" ]]; then
    source "$fzf_dir/shell/completion.zsh"
    source "$fzf_dir/shell/key-bindings.zsh"

    local fzf_color='bg+:0,pointer:4,info:4,border:0'
    local fzf_bind='ctrl-d:preview-page-down,ctrl-u:preview-page-up'
    local fzf_preview='(cat {} || ls -A {}) 2>/dev/null | head -200'

    export FZF_DEFAULT_COMMAND='rg --files --hidden'
    export FZF_DEFAULT_OPTS="--color '$fzf_color' --bind '$fzf_bind'"
    export FZF_CTRL_T_OPTS="--preview '$fzf_preview'"
    export FZF_ALT_C_OPTS="--preview '$fzf_preview'"
    export FZF_TMUX=1

    add-to-path "$fzf_dir/bin"
fi

#
# Init
#

add-to-fpath $ZSH_CACHE
compinit -d "$ZSH_CACHE/zcompdump"
