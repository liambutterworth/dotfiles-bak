#
# Zsh
#
# :: Plugins
# :: Aliases
# :: Settings
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
