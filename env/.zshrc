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
export LS_COLORS='no=00:fi=00:di=34:ow=34;40:ln=35:pi=30;44:so=35;44:do=35;44:bd=33;44:cd=37;44:or=05;37;41:mi=05;37;41:ex=01;31'

setopt prompt_subst

unsetopt beep

bindkey '^P' history-substring-search-up
bindkey '^N' history-substring-search-down

zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' '+m:{A-Z}={a-z}'

#
# Aliases
#

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
alias lg="gl ${lsflags} -la | grep"

alias c="clear"
alias o="open ."
alias s="source ~/.zshrc"

alias vv="vim ~/.vimrc"
alias vz="vim ~/.zshrc"
alias vt="vim ~/.tmux.conf"

alias ts="tmux"
alias tl="tmux ls"
alias tn="tmux new -s"
alias ta="tmux attach -t"
alias tr="tmux rename-session -t"
alias tk="tmux kill-session -t"

alias db="docker build -t"
alias dr="docker run -it"
alias di="docker images"
alias dI="docker image"
alias dc="docker ps -a"
alias dC="docker container"
alias dp="docker push"
alias dP="docker pull"
alias dt="docker tag"

alias dcu="docker-compose up"
alias dcd="docker-compose down"
alias dcf="docker-compose up -f"
alias dcr="docker-compose restart"

alias gp="git push"
alias gP="git pull"
alias ga="git add"
alias gA="git add -A"
alias gb="git branch"
alias gB="git checkout"
alias gc="git commit -m"
alias gC="git clone"
alias gf="git fetch"
alias gm="git merge"
alias gd="git rm"
alias gl="git log"
alias gs="git status"

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
