#
# Zsh
#
# :: Plugins
# :: Settings
# :: Aliases
# :: Prompt

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

setopt prompt_subst

bindkey '^P' history-substring-search-up
bindkey '^N' history-substring-search-down

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

#
# Aliases
#

alias c="clear"
alias o="open ."

ls --version &>/dev/null
if [ $? -eq 0 ]; then
  lsflags="--color --group-directories-first -F"
else
  lsflags="-GF"
  export CLICOLOR=1
fi

alias ls="ls ${lsflags}"
alias ll="ls ${lsflags} -l"
alias la="ls ${lsflags} -la"

alias tl="tmux ls"
alias tn="tmux new -s"
alias ta="tmux attach -t"
alias tr="tmux rename-session -t"
alias tk="tmux kill-session -t"

alias dr="docker run -it"
alias di="docker images"
alias dI="docker image"
alias dc="docker ps -a"
alias dC="docker container"

alias dcu="docker-compose up"
alias dcd="docker-compose down"

alias gp="git push"
alias gP="git pull"
alias gc="git commit -m"
alias gC="git clone"
alias gl="git log"
alias gs="git status"
alias gf="git fetch"
alias gm="git merge"
alias ga="git add"
alias gA="git add -A"
alias gb="git branch"
alias gB="git checkout"
alias gd="git rm"

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

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
