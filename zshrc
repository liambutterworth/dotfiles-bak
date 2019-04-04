#
# Zsh Config
#
# :: Settings
# :: Aliases
# :: Plugins

#
# Settings
#

export TERM="xterm-256color"
export LS_COLORS='no=00:fi=00:di=34:ow=34;40:ln=35:pi=30;44:so=35;44:do=35;44:bd=33;44:cd=37;44:or=05;37;41:mi=05;37;41:ex=01;31'
export GIT_LOG_FORMAT='%C(red)%h%C(reset) %C(yellow)%d%C(reset) %s %C(green)(%cr) %C(blue)<%an>%C(reset)'
export DOCKER_PS_FORMAT="ID\\t{{.ID}}\\nNAME\\t{{.Names}}\\nIMAGE\\t{{.Image}}\\nPORTS\\t{{.Ports}}\\nCOMMAND\\t{{.Command}}\\nCREATED\\t{{.CreatedAt}}\\nSTATUS\\t{{.Status}}\\n"
export DOCKER_LS_FORMAT="ID\\t{{.ID}}\\nREPO\\t{{.Repository}}\\nTAG\\t{{.Tag}}\\nCREATED\\t{{.CreatedAt}}\\nSIZE\\t{{.Size}}\\n"

zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{A-Z}={a-z}'
zstyle ':completion:*' auto-description 'Specify: %d'
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' completer _complete _correct _approximate
zstyle ':completion:*' menu select=2
zstyle ':completion:*' verbose true

bindkey -v
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word

autoload -Uz edit-command-line
autoload -Uz colors && colors
autoload -Uz compinit && compinit

preexec() { print }

#
# Aliases
#

if [[ -x "$(command -v gls)" ]]; then
    alias ls='gls --color --group-directories-first'
elif [[ `uname` = Linux ]]; then
    alias ls='ls --color --group-directories-first'
elif [[ `uname` = Darwin ]]; then
    alias ls='ls -G'
fi

alias ll='ls -lhA'
alias lp="tr ':' '\n' <<< $PATH"
alias lt="tree -I '.git|node_modules|vendor'"

alias vt='vim -p'
alias vs='vim -o'
alias vv='vim -O'

alias tc='clear && tmux clear-history'
alias tn='tmux rename-session'
alias ta='tmux attach-session -t'
alias tk='tmux kill-session -t'
alias tl='tmux list-sessions'

alias ga='git add'
alias gmv='git mv'
alias grm='git rm'
alias gun='git rm --cached'
alias gb='git branch'
alias gco='git checkout'
alias gc='git commit -m'
alias gst='git stash'
alias gd='git diff'
alias gdt='git diff-tree --no-commit-id --name-only -r'
alias gt='git tag'
alias gf='git fetch'
alias gl='git log'
alias gll="git log --graph --color=always --format='$GIT_LOG_FORMAT'"
alias grl='git reflog'
alias gsh='git show'
alias gs='git status'
alias gr='git root'

alias dc='docker container'
alias dcs="docker ps -a --format='$DOCKER_PS_FORMAT'"
alias di='docker image'
alias dis="docker image ls --format='$DOCKER_LS_FORMAT'"
alias db='docker build -t'
alias dr='docker run'
alias da='docker attach'
alias de='docker exec'
alias ds='docker stop'
alias dk='docker kill'

#
# Plugins
#

source ~/.zplug/init.zsh

zplug 'junegunn/fzf', hook-build:'./install --all --no-bash'
zplug 'mafredri/zsh-async'
zplug 'sindresorhus/pure'
zplug 'zsh-users/zsh-autosuggestions'
zplug 'zsh-users/zsh-completions'
zplug 'zsh-users/zsh-history-substring-search'
zplug 'zsh-users/zsh-syntax-highlighting', defer:2

zplug load

# Autosuggestions

export ZSH_AUTOSUGGEST_ACCEPT_WIDGETS=( forward-char end-of-line )

# History Substring Search

bindkey '^P' history-substring-search-up
bindkey '^N' history-substring-search-down

# FZF

export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
export FZF_CTRL_T_COMMAND=$FZF_DEFAULT_COMMAND
export FZF_DEFAULT_OPTS='--color bg+:0,pointer:4,info:4,border:0 --bind ctrl-d:preview-page-down,ctrl-u:preview-page-up'
export FZF_PREVIEW_OPTS='(cat {} || ls -A {}) 2> /dev/null | head -200'
export FZF_CTRL_T_OPTS="--preview '$FZF_PREVIEW_OPTS'"
export FZF_ALT_C_OPTS="--preview '$FZF_PREVIEW_OPTS'"
export FZF_TMUX=1

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
