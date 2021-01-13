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
alias tree="tree -a -I '.git|.DS_Store|node_modules|vendor|functions|plugged'"
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

set -g bg 282828
set -g bg1 3c3836
set -g bg2 584945
set -g bg3 665c54
set -g bg4 7c6f64
set -g fg ebdbb2
set -g fg1 ebdbb2
set -g fg2 d5c4a1
set -g fg3 bdae93
set -g fg4 a89984
set -g red fb4934
set -g green b8bb26
set -g yellow fabd2f
set -g blue 83a598
set -g purple d3869b
set -g orange fe8019
set -g cyan 8ec07c
set -g grey 928374

set -g fish_color_normal $fg
set -g fish_color_command $green
set -g fish_color_quote $yellow
set -g fish_color_redirection $orange
set -g fish_color_end $orange
set -g fish_color_error $red
set -g fish_color_param $fg
set -g fish_color_comment $bg3
set -g fish_color_match $yellow
set -g fish_color_search_match $bg
set -g fish_color_operator $orange
set -g fish_color_escape $orange
set -g fish_color_cwd $bg3
set -g fish_color_autosuggestion $bg3
set -g fish_color_user $bg3
set -g fish_color_host $bg3
set -g fish_color_cancel $red
set -g fish_pager_color_prefix $fg3
set -g fish_pager_color_completion $fg
set -g fish_pager_color_description $fg
set -g fish_pager_color_progress $yellow
set -g fish_pager_color_secondary $bg3

set pure_color_primary $blue
set pure_color_mute $bg3
set pure_color_info $cyan
set pure_color_success $purple
set pure_color_warning $yellow
set pure_color_danger $red

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
set -gx GOOGLE_APPLICATION_CREDENTIALS "$HOME/.config/google-cloud-sdk-auth/job-interview-2fa38-1041bf89ab68.json"
set -gx GOOGLE_AUTH_FILE "/$HOME/.config/google-cloud-sdk-auth/google_auth.txt"

switch (uname)
    case Darwin
        set -gx PYTHON_HOST_PROG '/usr/local/bin/python'
        set -gx PYTHON3_HOST_PROG '/usr/local/bin/python3'
        set -gx RUBY_HOST_PROG '/usr/local/opt/ruby/bin/ruby'

        set -gx fish_user_paths \
            "$HOME/.composer/vendor/bin" \
            "$HOME/.config/nvim/plugged/fzf/bin" \
            "$HOME/.config/google-cloud-sdk/bin" \
            '/usr/local/opt/coreutils/libexec/gnubin' \
            '/usr/local/opt/findutils/libexec/gnubin' \
            '/usr/local/opt/grep/libexec/gnubin' \
            '/usr/local/opt/gnu-sed/libexec/gnubin' \
            '/usr/local/opt/gnu-tar/libexec/gnubin' \
            '/usr/local/opt/gawk/libexec/gnubin' \
            '/usr/local/opt/ed/libexec/gnubin' \
            '/usr/local/opt/ruby/bin' \
            '/usr/local/opt/php/bin' \
            '/usr/local/opt/php/sbin' \
            '/usr/local/opt/node@10/bin'

    case Linux
        # todo
end

#
# Startup
#

if status is-interactive; and not set -q TMUX
  eval 'tmux attach || tmux new'
end

function pad_prompt --on-event fish_preexec
   echo
end

function fish_greeting; end
function fish_mode_prompt; end
function fish_vi_cursor; end
