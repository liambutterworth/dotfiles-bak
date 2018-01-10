#
# Zsh
#
# :: Plugins
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
export CLICOLOR=1

setopt prompt_subst

bindkey '^P' history-substring-search-up
bindkey '^N' history-substring-search-down

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

#
# Prompt
#

git_branch() {
	if ( $(git rev-parse --is-inside-work-tree 2>/dev/null) ); then
		ref=$(git symbolic-ref HEAD | cut -d'/' -f3)
		echo "(%F{2}$ref%F{4})"
	fi
}

local dir='%F{4}%3~$(git_branch)'
local user='%F{241}%n@%m'
local char='%(?.%F{5}.%F{1})%#'

PROMPT="
$dir $user
$char %F{15}"
