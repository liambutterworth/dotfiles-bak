#
# Fish Config
#
# :: Settings
# :: Aliases
# :: Bindings
# :: Colors

#
# Settings
#

set fish_greeting

set -U BROWSER 'chrome'
set -U EDITOR 'nvim'

if test (uname) = Darwin
    set -U BREW (brew --prefix)

    set -U fish_user_paths \
        "$BREW/opt/coreutils/libexec/gnubin" \
        "$BREW/opt/findutils/libexec/gnubin" \
        "$BREW/local/opt/grep/libexec/gnubin" \
        "$BREW/opt/gnu-sed/libexec/gnubin" \
        "$BREW/opt/gnu-tar/libexec/gnubin" \
        "$BREW/opt/gawk/libexec/gnubin" \
        "$BREW/opt/ed/libexec/gnubin" \
        "$BREW/opt/ruby/bin" \
        "$HOME/.config/nvim/plugs/fzf/bin"
end

if type -q fzf
    set -gx FZF_DEFAULT_OPTS "--color 'bg+:0,pointer:4,info:4,border:0'"
    set -gx FZF_CTRL_T_OPTS "--preview 'cat {}'"
    set -gx FZF_CTRL_T_COMMAND 'find -L -type f'
    set -gx FZF_ALT_C_OPTS "--preview 'ls -A {}'"
    set -gx FZF_ALT_C_COMMAND 'find -L -type d'
    set -gx FZF_TMUX 1
end

#
# Aliases
#

alias grep='grep --color=auto --perl-regexp'
alias less='less --clear-screen --raw-control-chars'
alias ls='ls --color=auto --group-directories-first'

alias b='bash'
alias c='clear'
alias d='docker'
alias dc='docker-compose'
alias e='exit'
alias g='git'
alias n='nvim'
alias m='mysql'
alias mc='mysql_config_editor'
alias pa='php artisan'
alias pc='composer'
alias so='source'
alias t='tmux -f ~/.config/tmux/tmux.conf'

#
# Bindings
#

fish_vi_key_bindings

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

set nord0 2e3440
set nord1 3b4252
set nord2 434c5e
set nord3 4c566a
set nord4 d8dee9
set nord5 e5e9f0
set nord6 eceff4
set nord7 8fbcbb
set nord8 88c0d0
set nord9 81a1c1
set nord10 5e81ac
set nord11 bf616a
set nord12 d08770
set nord13 ebcb8b
set nord14 a3be8c
set nord15 b48ead

set fish_color_normal $nord4
set fish_color_command $nord14
set fish_color_quote $nord13
set fish_color_autosuggestion $nord3
set fish_color_redirection $nord7
set fish_color_end $nord4
set fish_color_error $nord11
set fish_color_param $nord4
set fish_color_comment $nord3
set fish_color_match $nord13
set fish_color_search_match $nord10
set fish_color_operator $nord4
set fish_color_escape $nord13
set fish_color_cwd $nord9
set fish_color_user $nord3
set fish_color_host $nord3
set fish_color_cancel $nord11
set fish_pager_color_prefix $nord13
set fish_pager_color_completion $nord6
set fish_pager_color_description $nord10
set fish_pager_color_progress $nord12
set fish_pager_color_secondary $nord1
