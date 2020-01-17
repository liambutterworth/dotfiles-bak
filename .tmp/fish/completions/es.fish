set -l query_completion (__fish_complete_suffix $HOME/.config/es/query/ .json | sed -r 's/.+\/(.+)\..+/\1/')

complete -c es -n 'fish_using_command es query' -x -a "$query_completion"
complete -c es -n 'fish_using_command es q' -x -a "$query_completion"
