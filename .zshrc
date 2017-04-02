#
# ZSH Config
#

# path to oh my zsh
ZSH=$HOME/.oh-my-zsh

# add theme
ZSH_THEME="robbyrussell"

# add plugins
plugins=(osx tmux git node npm jsontools)

# auto start tmux
ZSH_TMUX_AUTOSTART=true
ZSH_TMUX_AUTOSTART_ONCE=false

# set user path
export PATH=$HOME/bin:/usr/local/bin:$PATH

# use 256 color palette
export TERM='xterm-256color'

# setup oh my zsh
source $ZSH/oh-my-zsh.sh
