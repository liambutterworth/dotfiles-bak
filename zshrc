#
# Zsh Config
#
# :: Settings
# :: Aliases
# :: Plugins

#
# Settings
#

autoload -Uz compinit && compinit -d ~/.cache/zsh/zcompdump
autoload -Uz colors && colors
autoload -Uz edit-command-line
autoload -Uz vcs_info

zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{A-Z}={a-z}'
zstyle ':completion:*' auto-description 'Specify: %d'
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' completer _complete _correct _approximate
zstyle ':completion:*' menu select=2
zstyle ':completion:*' verbose true
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr '*'
zstyle ':vcs_info:*' stagedstr '*'
zstyle ':vcs_info:*' formats '%b%c%u'

bindkey -v
bindkey '^w' backward-kill-word
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char

function precmd {
    vcs_info;
    print;
}

function preexec {
    print;
}

function set-prompt {
    PROMPT='%F{4}%3~%F{8}'
    [[ -n "$vcs_info_msg_0_" ]] && PROMPT+=" ${vcs_info_msg_0_}"
    [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ] && PROMPT+=' %n@%m'
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

#
# Aliases
#


if [[ `uname` = 'Linux' ]]; then
    alias ls='ls --color=auto --group-directories-first'
else
    alias ls='ls -G'
fi

alias la='ls -A'
alias ll='la -l'

alias vr='vim -r'
alias vd='vim -d'
alias vt='vim -p'
alias vs='vim -o'
alias vv='vim -O'

alias ta='tmux attach-session -t'
alias tc='clear && tmux clear-history'
alias tk='tmux kill-session -t'
alias tl='tmux list-sessions'
alias tn='tmux rename-session'

alias gcl='git clone'
alias ga='git add'
alias gmv='git mv'
alias grm='git rm'
alias gsh='git show'
alias gs='git status'
alias gb='git branch'
alias gco='git checkout'
alias gc='git commit -m'
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

#
# Plugins
#

export ZSH_PLUGS_DIR="$HOME/.dotfiles/plugs/zsh"

if [ -d "$ZSH_PLUGS_DIR/zsh-autosuggestions" ]; then
    export ZSH_AUTOSUGGEST_ACCEPT_WIDGETS=( forward-char end-of-line )
    source "$ZSH_PLUGS_DIR/zsh-autosuggestions/zsh-autosuggestions.zsh"
fi

if [ -d "$ZSH_PLUGS_DIR/zsh-history-substring-search" ]; then
    bindkey '^P' history-substring-search-up
    bindkey '^N' history-substring-search-down
    source "$ZSH_PLUGS_DIR/zsh-history-substring-search/zsh-history-substring-search.zsh"
fi

if [ -d "$ZSH_PLUGS_DIR/zsh-syntax-highlighting" ]; then
    source "$ZSH_PLUGS_DIR/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
fi

if [ -f "$ZSH_PLUGS_DIR/fzf/bin/fzf" ]; then
    export PATH="$PATH:$HOME/.dotfiles/plugs/zsh/fzf/bin"
    export FZF_DEFAULT_OPTS='--color bg+:0,pointer:4,info:4,border:0 --bind ctrl-d:preview-page-down,ctrl-u:preview-page-up'
    export FZF_PREVIEW_OPTS='(cat {} || ls -A {}) 2> /dev/null | head -200'
    export FZF_CTRL_T_OPTS="--preview '$FZF_PREVIEW_OPTS'"
    export FZF_ALT_C_OPTS="--preview '$FZF_PREVIEW_OPTS'"
    export FZF_TMUX=1

    source "$ZSH_PLUGS_DIR/fzf/shell/completion.zsh"
    source "$ZSH_PLUGS_DIR/fzf/shell/key-bindings.zsh"
fi
