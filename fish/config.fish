#
# Fish Config
#
# :: Settings
# :: Aliases
# :: Bindings
# :: Colors
# :: Environment
# :: Fisher

#
# Settings
#

set fish_greeting

#
# Aliases
#

alias grep='grep --color=auto'
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

#
# Environment
#

set -gx EDITOR 'nvim'

if test (uname) = Darwin
    set -gx PATH '/usr/local/opt/coreutils/libexec/gnubin' $PATH
    set -gx PATH '/usr/local/opt/findutils/libexec/gnubin' $PATH
    set -gx PATH '/usr/local/opt/grep/libexec/gnubin' $PATH
    set -gx PATH '/usr/local/opt/gnu-sed/libexec/gnubin' $PATH
    set -gx PATH '/usr/local/opt/gnu-tar/libexec/gnubin' $PATH
    set -gx PATH '/usr/local/opt/gawk/libexec/gnubin' $PATH
    set -gx PATH '/usr/local/opt/ed/libexec/gnubin' $PATH
    set -gx PATH '/usr/local/opt/make/libexec/gnubin' $PATH
    set -gx PATH '/usr/local/opt/mysql@5.7/bin' $PATH
    set -gx PATH '/usr/local/opt/node@10/bin' $PATH
    set -gx PATH '/usr/local/opt/php@7.2/bin' $PATH
    set -gx PATH '/usr/local/opt/php@7.2/sbin' $PATH
end

if type -q fzf
    set fzf_color "--color 'bg+:0,pointer:4,info:4,border:0'"
    set fzf_preview_bind "--bind 'ctrl-d:half-page-down,ctrl-u:half-page-up'"
    set fzf_preview_files "--preview 'cat {}' $fzf_preview_bind"
    set fzf_preview_dirs "--preview 'ls -A {}' $fzf_preview_bind"

    set -gx FZF_DEFAULT_OPTS $fzf_color
    set -gx FZF_CTRL_T_COMMAND 'find -type f'
    set -gx FZF_CTRL_T_OPTS $fzf_preview_files
    set -gx FZF_ALC_C_COMMAND 'find -type d'
    set -gx FZF_ALT_C_OPTS $fzf_preview_dirs
    set -gx FZF_TMUX 1

    bind -M insert \cg fzf-cd-widget
end
