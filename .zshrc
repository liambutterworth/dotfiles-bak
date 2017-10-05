#
# Zsh Config
#
# :: Plugins
# :: Tab Completion

#
# Plugins
#

source ~/.zplug/init.zsh

zplug "zplug/zplug", hook-build:"zplug --self-manage"
zplug "mafredri/zsh-async", from:github
zplug "sindresorhus/pure", use:pure.zsh, from:github, as:theme
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-history-substring-search", defer:3

zplug load

#
# Completion
#

# enable completion
autoload -U compinit && compinit

# enable  shift tab in menu completion
bindkey '^[[Z' reverse-menu-complete

# use N and P for substring history
bindkey -M emacs '^P' history-substring-search-up
bindkey -M emacs '^N' history-substring-search-down

# enable cli color for commands
export CLICOLOR=1

# setup menu completion
zstyle ':completion:*' menu select
zstyle ':completion:*' completer _complete _approximate _expand
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
