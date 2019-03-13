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
antigen apply

#
# Settings
#

export TERM="xterm-256color"
export LS_COLORS='no=00:fi=00:di=34:ow=34;40:ln=35:pi=30;44:so=35;44:do=35;44:bd=33;44:cd=37;44:or=05;37;41:mi=05;37;41:ex=01;31'
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'

setopt autocd
setopt auto_menu
setopt prompt_subst

unsetopt beep
unsetopt correct_all
unsetopt menu_complete

bindkey '^P' history-substring-search-up
bindkey '^N' history-substring-search-down

#
# Aliases
#

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

case `uname` in
    Linux)
        alias ls='ls --color --group-directories-first'
        alias ll='ls -la'
        ;;
    Darwin)
        alias ls='ls -G'
        alias ll='ls -la'
        ;;
esac

#
# Prompt
#

red='%F{1}'
green='%F{2}'
yellow='%F{3}'
blue='%F{4}'
purple='%F{5}'
teal='%F{6}'
grey='%F{7}'

git_branch() {
    if ( $(git rev-parse --is-inside-work-tree 2>/dev/null) ); then
        branch_name=$(git symbolic-ref HEAD | cut -d'/' -f3)

        # if there are untracked files
        if [[ -n $(git ls-files --other --exclude-standard 2> /dev/null) ]]; then
            color=$red

        # if there are modified files
        elif ! git diff --quiet 2> /dev/null; then
            color=$yellow

        # if there are staged files
        elif ! git diff --cached --quiet 2> /dev/null; then
           color=$green

        # working directory clean
        else
            color=$grey
        fi

        echo "(${color}${branch_name}${blue})"
    fi
}

user_info() {
    if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then	
        echo '${grey}%n@%m${blue}'
    fi
}

local dir='${blue}%3~$(git_branch)'
local user='$(user_info)'
local char='%(?.${purple}.${red})%#'

PROMPT="
$dir $user
$char %F{15}"
