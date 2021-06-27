#
# Fish Config
#
# :: Aliases
# :: Bindings
# :: Colors
# :: Exports
# :: Prompt

#
# Aliases
#

alias grep='grep --color=auto --exclude-dir={.git,node_modules,vendor}'
alias less='less --clear-screen --raw-control-chars'
alias ls='ls --color=auto --group-directories-first'
alias tree="tree -a -I '.git|.DS_Store|node_modules|vendor|functions|plugged'"

alias a='php artisan'
alias c='composer'
alias d='docker'
alias e='nvim'
alias dc='docker-compose'
alias g='git'
alias l='laravel'
alias n='npm'
alias r='source ~/.config/fish/config.fish'
alias t='tmux'

#
# Bindings
#

bind -M insert \cf accept-autosuggestion
bind -M insert \cx accept-autosuggestion execute
bind -M insert \cp history-search-backward
bind -M insert \cn history-search-forward
bind -M insert \cg fzf-cd-widget

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

#
# Exports
#

set -gx EDITOR "nvim"
set -gx XDG_CONFIG_HOME "$HOME/.config"
set -gx XDG_CACHE_HOME "$HOME/.cache"
set -gx XDG_DATA_HOME "$HOME/.local/share"
set -gx XDG_STATE_HOME "$HOME/.local/state"
set -gx DOCKER_CONFIG "$XDG_CONFIG_HOME/docker"
set -gx LESSHISTFILE "$XDG_CACHE_HOME/less"
set -gx FZF_COLORS (cat $XDG_CONFIG_HOME/fish/fzfcolors | sed "\$!s/\$/,/" | tr -d '\n')
set -gx FZF_ALT_C_COMMAND "find -type d"
set -gx FZF_ALT_C_OPTS "--preview 'ls -A {}'"
set -gx FZF_CTRL_T_COMMAND "find -type f"
set -gx FZF_CTRL_T_OPTS "--preview 'cat {}'"
set -gx FZF_DEFAULT_OPTS "--color $FZF_COLORS"
set -gx FZF_TMUX 1

eval (dircolors -c $XDG_CONFIG_HOME/fish/dircolors)

if test -e $XDG_CONFIG_HOME/fish/profile.fish
    source $XDG_CONFIG_HOME/fish/profile.fish
end

#
# Prompt
#

fish_vi_key_bindings

function fish_greeting; end
function fish_mode_prompt; end
function fish_vi_cursor; end

function fish_prompt
    set_color $blue
    printf '\033[1m%-1s\033[0m' (dirs)
    set_color $bg3
    printf (git branch ^/dev/null | sed -n '/\* /s///p')
    set_color $purple

    printf '\n\033[1m%-2s\033[0m' (switch $fish_bind_mode
        case default; echo \U276E
        case insert;  echo \U276F
    end)
end

function pad_prompt -e fish_preexec -e fish_postexec
    echo
end
