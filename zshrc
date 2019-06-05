#
# Zsh Config
#
# :: Settings
# :: Aliases
# :: Plugins

#
# Settings
#

export CACHE="~/.cache"
export DOTFILES="$HOME/.dotfiles"
export ZSH_CACHE="$CACHE/zsh"
export VIM_CACHE="$CACHE/vim"
export ZSH_PLUGS="$DOTFILES/plugs/zsh"
export VIM_PLUGS="$DOTFILES/plugs/vim"

autoload -Uz compinit && compinit -d "$ZSH_CACHE/zcompdump"
autoload -Uz colors && colors
autoload -Uz edit-command-line
autoload -Uz vcs_info

zstyle ':completion:*' menu select
zstyle ':completion:*' list-dirs-first true
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' completer _complete _correct _ignored _approximate
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr '*'
zstyle ':vcs_info:*' stagedstr '*'
zstyle ':vcs_info:*' formats '%b%c%u'

bindkey -v
bindkey '^w' backward-kill-word
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^[[Z' reverse-menu-complete

function set-prompt {
    PROMPT='%F{4}%3~%F{8}'
    [[ -n $vcs_info_msg_0_ ]] && PROMPT+=" ${vcs_info_msg_0_}"
    [ -n $SSH_CLIENT ] || [ -n $SSH_TTY ] && PROMPT+=' %n@%M'
    PROMPT+=$'\n''%(?.%F{5}.%F{1})'
    [[ $KEYMAP = 'vicmd' ]] && PROMPT+='❮' || PROMPT+='❯'
    PROMPT+='%F{7} '
}

function zle-line-init zle-keymap-select {
    set-prompt
    zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select

function precmd { vcs_info; print }
function preexec { print }

#
# Aliases
#

alias ls='ls --color=auto --group-directories-first'
alias la='ls -A'
alias ll='ls -lA'
alias grep='grep --color=always --exclude-dir=.git --exclude-dir=vendor --exclude-dir=node_modules'
alias less='less --raw-control-chars'

alias ts='tmux new -s'
alias ta='tmux attach-session -t'
alias tk='tmux kill-session -t'
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

alias db='docker build'
alias dr='docker run'
alias de='docker exec'
alias dc='docker container'
alias di='docker image'
alias dp='docker system prune'
alias dl='docker logs'
alias dlc="docker container ls --all --format='table {{.ID}}\t{{.Image}}\t{{.Names}}\t{{.Status}}'"
alias dli="docker image ls --all --format='table {{.ID}}\t{{.Repository}}\t{{.Tag}}\t{{.CreatedAt}}'"
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

# Completions

completions_dir="$ZSH_PLUGS/zsh-completions"

if [ -d $completions_dir ]; then
    fpath=("$completions_dir/src" $fpath)
    rm -f "$ZSH_CACHE/zcompdump"
    compinit -d "$ZSH_CACHE/zcompdump"
fi

# Autosuggestions

auto_suggestions_file="$ZSH_PLUGS/zsh-autosuggestions/zsh-autosuggestions.zsh"

if [ -f $auto_suggestions_file ]; then
    source $auto_suggestions_file
    export ZSH_AUTOSUGGEST_ACCEPT_WIDGETS=( forward-char end-of-line )
fi

# History Substring Search

history_substring_search_file="$ZSH_PLUGS/zsh-history-substring-search/zsh-history-substring-search.zsh"

if [ -f $history_substring_search_file ]; then
    source $history_substring_search_file
    bindkey '^P' history-substring-search-up
    bindkey '^N' history-substring-search-down
fi

# Syntax Highlighting

syntax_highlighting_file="$ZSH_PLUGS/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

if [ -f $syntax_highlighting_file ]; then
    source $syntax_highlighting_file
fi

# FZF

fzf_dir="$ZSH_PLUGS/fzf"

if [ -f "$fzf_dir/bin/fzf" ]; then
    source "$fzf_dir/shell/completion.zsh"
    source "$fzf_dir/shell/key-bindings.zsh"

    if command -v rg >/dev/null; then
        export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow'
    fi

    export PATH="$PATH:$fzf_dir/bin"
    export FZF_DEFAULT_OPTS='--color bg+:0,pointer:4,info:4,border:0 --bind ctrl-d:preview-page-down,ctrl-u:preview-page-up'
    export FZF_PREVIEW_OPTS='(cat {} || ls -A {}) 2> /dev/null | head -200'
    export FZF_CTRL_T_OPTS="--preview '$FZF_PREVIEW_OPTS'"
    export FZF_ALT_C_OPTS="--preview '$FZF_PREVIEW_OPTS'"
    export FZF_TMUX=1
fi
