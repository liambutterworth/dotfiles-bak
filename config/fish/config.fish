#
# Fish Config
#
# :: Aliases
# :: Bindings
# :: Exports
# :: Prompt

#
# Aliases
#

alias c='docker-compose'
alias d='docker'
alias e='nvim'
alias g='git'
alias l='ls -Ahl --group-directories-first'
alias n='npm'
alias p='paru'
alias r='source ~/.config/fish/config.fish'
alias t='tree --dirsfirst -I "node_modules|plugged|vendor"'

#
# Bindings
#

bind -M insert \cf accept-autosuggestion
bind -M insert \cx accept-autosuggestion execute
bind -M insert \cp history-search-backward
bind -M insert \cn history-search-forward
bind -M insert \cg fzf-cd-widget

#
# Exports
#

set FZF_COLORS (string join ',' \
    "bg:-1" \
    "bg+:-1" \
    "fg:white" \
    "fg+:white" \
    "info:yellow" \
    "border:-1" \
    "header:white" \
    "hl:green" \
    "hl+:green" \
    "marker:green" \
    "pointer:magenta" \
    "prompt:blue" \
    "spinner:cyan" \
)

set -gx XDG_CONFIG_HOME "$HOME/.config"
set -gx XDG_CACHE_HOME "$HOME/.cache"
set -gx XDG_DATA_HOME "$HOME/.local/share"
set -gx XDG_STATE_HOME "$HOME/.local/state"
set -gx DOCKER_CONFIG "$XDG_CONFIG_HOME/docker"
set -gx LESSHISTFILE "$XDG_CACHE_HOME/less"
set -gx NPM_CONFIG_USERCONFIG $XDG_CONFIG_HOME/npm/npmrc
set -gx CARGO_HOME "$XDG_DATA_HOME/cargo"
set -gx RUSTUP_HOME "$XDG_DATA_HOME/rustup"
set -gx PYTHON3_HOST_PROG (which python3)
set -gx FZF_DEFAULT_COMMAND "rg --files --hidden"
set -gx FZF_CTRL_T_COMMAND "rg --files --hidden"
set -gx FZF_DEFAULT_OPTS "--color $FZF_COLORS --no-preview"
set -gx FZF_TMUX 1

eval (dircolors -c $XDG_CONFIG_HOME/dircolors)

if test -e $XDG_CONFIG_HOME/fish/profile.fish
    source $XDG_CONFIG_HOME/fish/profile.fish
end

#
# Prompt
#

fish_vi_key_bindings
fzf_key_bindings

set -g fish_color_autosuggestion brblack
set -g fish_color_cancel red
set -g fish_color_command green
set -g fish_color_comment brblack
set -g fish_color_cwd blue
set -g fish_color_end yellow
set -g fish_color_error red
set -g fish_color_escape cyan
set -g fish_color_host brblack
set -g fish_color_match green
set -g fish_color_normal red
set -g fish_color_operator yellow
set -g fish_color_param white
set -g fish_color_quote yellow
set -g fish_color_redirection yellow
set -g fish_color_search_match green
set -g fish_color_user brblack
set -g fish_pager_color_completion white
set -g fish_pager_color_description yellow
set -g fish_pager_color_prefix green
set -g fish_pager_color_progress yellow
set -g fish_pager_color_secondary magenta

function fish_greeting; end
function fish_mode_prompt; end
function fish_vi_cursor; end

function pad_prompt -e fish_preexec -e fish_postexec
    echo
end

function fish_prompt
    set_color blue

    printf '\033[1m%s\033[0m' (dirs)

    set_color brblack

    printf ' %s' (git branch 2>/dev/null | sed -n '/\* /s///p')

    set_color magenta

    printf '\n\033[1m%-2s\033[0m' (switch $fish_bind_mode
        case default; echo \U276E
        case insert;  echo \U276F
    end)
end
