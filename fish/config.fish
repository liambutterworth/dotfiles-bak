#
# Fish Config
#
# :: Aliases
# :: Bindings
# :: Colors
# :: Exports
# :: Startup

#
# Aliases
#

alias grep='grep --color=auto --exclude-dir={.git,node_modules,vendor}'
alias less='less --clear-screen --raw-control-chars'
alias ls='ls --color=auto --group-directories-first'
alias tmux='tmux -f ~/.config/tmux/tmux.conf'
alias ssh='env TERM=xterm ssh'

alias a='php artisan'
alias b='bash'
alias c='composer'
alias d='docker'
alias dc='docker-compose'
alias e='nvim'
alias g='git'
alias l='laravel'
alias m='mysql'
alias mc='mysql_config_editor'
alias n='npm'
alias r='source ~/.config/fish/config.fish'
alias t='tmux'
alias v='vue'

#
# Bindings
#

bind -M insert \cf accept-autosuggestion
bind -M insert \cx accept-autosuggestion execute
bind -M insert \cp history-search-backward
bind -M insert \cn history-search-forward

if type -q fzf
    bind -M insert \cg fzf-cd-widget
end

#
# Colors
#

theme_gruvbox

#
# Exports
#

set -gx FZF_COLORS "\
fg:#fbf1c7,\
bg:#282828,\
fg+:#fabd2f,\
bg+:#282828,\
info:#b8bb26,\
border:#282828,\
prompt:#83a598,\
pointer:#fb4934"

set -gx DOCKER_CONFIG "$HOME/.config/docker"
set -gx EDITOR 'nvim'
set -gx FZF_ALT_C_COMMAND "find -type d"
set -gx FZF_ALT_C_OPTS "--preview 'ls -A {}'"
set -gx FZF_CTRL_T_COMMAND "find -type f"
set -gx FZF_CTRL_T_OPTS "--preview 'cat {}'"
set -gx FZF_DEFAULT_OPTS "--color $FZF_COLORS"
set -gx FZF_TMUX 1

switch (uname)
    case Darwin
        set -gx PYTHON_HOST_PROG '/usr/local/bin/python'
        set -gx PYTHON3_HOST_PROG '/usr/local/bin/python3'
        set -gx RUBY_HOST_PROG '/usr/local/opt/ruby/bin/ruby'

        set -gx fish_user_paths \
            "$HOME/.composer/vendor/bin" \
            "$HOME/.config/nvim/plugged/fzf/bin" \
            '/usr/local/opt/coreutils/libexec/gnubin' \
            '/usr/local/opt/findutils/libexec/gnubin' \
            '/usr/local/opt/grep/libexec/gnubin' \
            '/usr/local/opt/gnu-sed/libexec/gnubin' \
            '/usr/local/opt/gnu-tar/libexec/gnubin' \
            '/usr/local/opt/gawk/libexec/gnubin' \
            '/usr/local/opt/ed/libexec/gnubin' \
            '/usr/local/opt/ruby/bin'

    case Linux
        # todo
end

#
# Startup
#

if status is-interactive; and not set -q TMUX
   eval 'tmux attach || tmux new'
end

function fish_vi_cursor; end
