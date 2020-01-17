set -l query_completion (__fish_complete_suffix $HOME/.config/db/query/ .sql | sed -r 's/.+\/(.+)\..+/\1/')

complete -c db -n 'fish_using_command db query' -x -a "$query_completion"
complete -c db -n 'fish_using_command db q' -x -a "$query_completion"
