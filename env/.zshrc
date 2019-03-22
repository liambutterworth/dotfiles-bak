#
# Zsh Config
#
# :: Plugins
# :: Settings
# :: Aliases
# :: Prompt
# :: Fuzzy Finder

#
# Plugins
#

source ~/.zsh/antigen.zsh

antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-history-substring-search
antigen bundle zsh-users/zsh-syntax-highlighting

antigen apply

#
# Settings
#

export TERM="xterm-256color"
export LS_COLORS='no=00:fi=00:di=34:ow=34;40:ln=35:pi=30;44:so=35;44:do=35;44:bd=33;44:cd=37;44:or=05;37;41:mi=05;37;41:ex=01;31'

setopt autocd
setopt auto_menu

unsetopt beep
unsetopt correct_all
unsetopt menu_complete

zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{A-Z}={a-z}'
zstyle ':completion:*' auto-description 'Specify: %d'
zstyle ':completion:*' format 'Completing: %d'
zstyle ':completion:*' completer _complete _correct _approximate
zstyle ':completion:*' menu select=2
zstyle ':completion:*' verbose true

bindkey -v
bindkey '^P' history-substring-search-up
bindkey '^N' history-substring-search-down
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word

autoload -U edit-command-line
autoload -U colors && colors

#
# Aliases
#

alias ls='gls --color --group-directories-first'
alias ll='ls -la'
alias lt="tree -a -I '.git|node_modules|vendor'"

alias vp='vim -p'
alias vs='vim -o'
alias vv='vim -O'

alias ta='tmux attach-session -t'
alias tk='tmux kill-session -t'
alias tl='tmux list-sessions'
alias tn='tmux rename-session'

alias groot='cd $(git rev-parse --show-toplevel); echo $(pwd)'
alias ga='git add'
alias gmv='git mv'
alias grm='git rm'
alias gb='git branch'
alias gco='git checkout'
alias gc='git commit -m'
alias gst='git stash'
alias gd='git diff'
alias gdt="git diff-tree --no-commit-id --name-only -r"
alias gt='git tag'
alias gf='git fetch'
alias gl='git log'
alias gll="git log --graph --pretty=format:'%C(red)%h%Creset -%C(yellow)%d%Creset %s %C(green)(%cr) %C(blue)<%an>%Creset' --abbrev-commit"
alias grl='git reflog'
alias gsh='git show'
alias gs='git status'
alias gw='while; do; clear; gs -sbu; sleep 1; done'

#
# Prompt
#

git-info() {
    if ( $(git rev-parse --is-inside-work-tree 2>/dev/null) ); then
        local branch=$(git symbolic-ref HEAD | cut -d'/' -f3)
        [[ $(git status --porcelain 2>/dev/null | tail -n1) != '' ]] && branch+='*'
        echo $branch
    fi
}

user-info() {
    [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ] && echo '%n@%m'
}

set-prompt() {
    [[ $KEYMAP = 'vicmd' ]] && char="❮" || char="❯"
    PROMPT="%F{4}%3~ %F{8}$(git-info) $(user-info)"
    PROMPT+=$'\n'"%(?.%F{5}.%F{1})$char "
}

precmd() { print }
preexec() { print }

function zle-line-init zle-keymap-select {
    set-prompt
    zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select

#
# Fuzzy Finder
#

export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
export FZF_CTRL_T_COMMAND=$FZF_DEFAULT_COMMAND
export FZF_DEFAULT_OPTS='--color bg+:0,pointer:4,info:4,border:0'
export FZF_PREVIEW_OPTS='(highlight -0 ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'
export FZF_CTRL_T_OPTS="--preview '$FZF_PREVIEW_OPTS'"
export FZF_TMUX=1

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
