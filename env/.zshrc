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
alias gaa='git add .'
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

git_branch() {
	if ( $(git rev-parse --is-inside-work-tree 2>/dev/null) ); then
		ref=$(git symbolic-ref HEAD | cut -d'/' -f3)
		echo "(%F{2}$ref%F{4})"
	fi
}

user_info() {
	if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then	
		echo '%F{8}%n@%m'
	fi
}

local dir='%F{4}%3~$(git_branch)'
local user='$(user_info)'
local char='%(?.%F{5}.%F{1})%#'

PROMPT="
$dir $user
$char %F{15}"
