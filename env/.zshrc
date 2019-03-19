#
# Zsh Config
#
# :: Plugins
# :: Settings
# :: Aliases
# :: Prompt

source ~/.zsh/antigen.zsh
source ~/.fzf.zsh

#
# Plugins
#

antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-history-substring-search
antigen bundle zsh-users/zsh-syntax-highlighting
# antigen bundle mafredri/zsh-async
# antigen bundle sindresorhus/pure
antigen apply

#
# Settings
#

export TERM="xterm-256color"
export LS_COLORS='no=00:fi=00:di=34:ow=34;40:ln=35:pi=30;44:so=35;44:do=35;44:bd=33;44:cd=37;44:or=05;37;41:mi=05;37;41:ex=01;31'
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
export FZF_CTRL_T_COMMAND=$FZF_DEFAULT_COMMAND

setopt autocd
setopt auto_menu

unsetopt beep
unsetopt correct_all
unsetopt menu_complete

bindkey -v
bindkey '^P' history-substring-search-up
bindkey '^N' history-substring-search-down
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word

zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{A-Z}={a-z}'
zstyle ':completion:*' auto-description 'Specify: %d'
zstyle ':completion:*' format 'Completing: %d'
zstyle ':completion:*' completer _complete _correct _approximate
zstyle ':completion:*' menu select=2
zstyle ':completion:*' verbose true

autoload -U edit-command-line
autoload -U colors && colors

# autoload -U promptinit && promptinit
# prompt pure

#
# Aliases
#

alias ls='gls --color --group-directories-first'
alias ll='ls -la'
alias lt='tree -a -I ".git|node_modules|vendor"'

alias vp='vim -p'
alias vs='vim -o'
alias vv='vim -O'

alias ta='tmux attach-session -t'
alias tk='tmux kill-session -t'
alias tl='tmux list-sessions'
alias tn='tmux rename-session'

alias gr='cd $(git rev-parse --show-toplevel); echo $(pwd)'
alias ga='git add'
alias gmv='git mv'
alias grm='git rm'
alias gb='git branch'
alias gco='git checkout'
alias gc='git commit -m'
alias gst='git stash'
alias gd='git diff'
alias gt='git tag'
alias gf='git fetch'
alias gl='git log'
alias gll='git log --graph --pretty=format:'\''%Cred%h%Creset =%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'\'' --abbrev-commit'
alias grl='git reflog'
alias gsh='git show'
alias gs='git status'
alias gw='while; do; clear; gs -sbu; sleep 1; done'

    #
# Prompt
#

local red='%F{1}'
local green='%F{2}'
local yellow='%F{3}'
local blue='%F{4}'
local purple='%F{5}'
local teal='%F{6}'
local grey='%F{8}'
local white='%F{15}'

git-info() {
    if ( $(git rev-parse --is-inside-work-tree 2>/dev/null) ); then
        local branch=$(git symbolic-ref HEAD | cut -d'/' -f3)
        # [[ $(git diff --shortstat 2>/dev/null | tail -n1) != "" ]] && branch+="*"
        [[ $(git status --porcelain 2>/dev/null | tail -n1) != "" ]] && branch+="*"

        # local directory=$(git rev-parse --git-dir 2> /dev/null)
        # local color=$grey
        # local output=""

        # if there are untracked files
        # if [[ -n $(git ls-files --other --exclude-standard 2> /dev/null) ]]; then
        #     color=$red

        # if there are modified files
        # elif ! git diff --quiet 2> /dev/null; then
        #     color=$yellow

        # if there are staged files
        # elif ! git diff --cached --quiet 2> /dev/null; then
        #     color=$green
        # fi

        # output="(${color}${branch}${blue})"

        # if merging
        # if test -r $directory/MERGE_HEAD; then
        #     output+="${blue}->${purple}merging${blue}"
        # fi

        echo "${grey}${branch}"
    fi
}

user-info() {
    if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
        echo '${grey}%n@%m${blue}'
    fi
}

set-prompt() {
    local dir="${blue}%3~"
    local char="%(?.${purple}.${red})"
    local newline=$'\n'

    case ${KEYMAP} in
        (vicmd)      char+="❮" ;;
        (main|viins) char+="❯" ;;
    esac

    PROMPT="${dir} $(git-info) $(user-info)${newline}${char} "
}

function zle-line-init zle-keymap-select {
    set-prompt
    zle reset-prompt
}

precmd() { print }
preexec() { print }

zle -N zle-line-init zle-keymap-select
