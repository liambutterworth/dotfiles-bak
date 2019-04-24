#
# Zsh Config
#
# :: Settings
# :: Aliases
# :: Plugins

#
# Settings
#

autoload -Uz compinit && compinit
autoload -Uz colors && colors
autoload -Uz edit-command-line
autoload -Uz vcs_info

bindkey -v
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word

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

function set-prompt {
    PROMPT='%F{4}%3~%F{8}'
    [[ -n "$vcs_info_msg_0_" ]] && PROMPT+=" ${vcs_info_msg_0_}"
    [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ] && PROMPT+=' %n@%m'
    PROMPT+=$'\n''%(?.%F{5}.%F{1})'
    [[ $KEYMAP = 'vicmd' ]] && PROMPT+='❮' || PROMPT+='❯'
    PROMPT+=' '
}

function zle-line-init zle-keymap-select {
    set-prompt
    zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select

precmd() { vcs_info; print }
preexec() { print }

#
# Aliases
#

alias /='cd /'
alias ~='cd ~'
alias ..='cd ..'
alias -- -='cd -'
alias src='source ~/.zshrc; echo source ~/.zshrc'

alias ea='exa --all --group-directories-first'
alias el='ea --long --git --time-style="iso"'
alias et='ea --tree --ignore-glob=".git|node_modules|vendor"'
alias ep="echo '${PATH//:/\n}'"
alias ef="echo '${fpath// /\n}'"

alias vc='vim --clean'
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

source ~/.zplug/init.zsh

zplug 'junegunn/fzf', hook-build:'./install --all --no-bash'
zplug 'zsh-users/zsh-autosuggestions'
zplug 'zsh-users/zsh-completions'
zplug 'zsh-users/zsh-history-substring-search'
zplug 'zsh-users/zsh-syntax-highlighting', defer:2

zplug load

# FZF

export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'
export FZF_CTRL_T_COMMAND=$FZF_DEFAULT_COMMAND
export FZF_DEFAULT_OPTS='--color bg+:0,pointer:4,info:4,border:0 --bind ctrl-d:preview-page-down,ctrl-u:preview-page-up'
export FZF_PREVIEW_OPTS='(cat {} || ls -A {}) 2> /dev/null | head -200'
export FZF_CTRL_T_OPTS="--preview '$FZF_PREVIEW_OPTS'"
export FZF_ALT_C_OPTS="--preview '$FZF_PREVIEW_OPTS'"
export FZF_TMUX=1

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Autosuggestions

export ZSH_AUTOSUGGEST_ACCEPT_WIDGETS=( forward-char end-of-line )

# History Substring Search

bindkey '^P' history-substring-search-up
bindkey '^N' history-substring-search-down
