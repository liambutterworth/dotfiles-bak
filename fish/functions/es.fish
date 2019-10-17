function es -a action
    set -e argv[1]
    set -l options

    set options $options (fish_opt --short c --long connection --required-val)
    set options $options (fish_opt --short d --long delete)
    set options $options (fish_opt --short H --long header --required-val)
    set options $options (fish_opt --short i --long index --required-val)
    set options $options (fish_opt --short p --long params --required-val)
    set options $options (fish_opt --short P --long print)
    set options $options (fish_opt --short r --long results)

    argparse $options -- $argv

    set -l dir "$HOME/.config/es"
    set -l query_dir "$dir/query"
    set -l results_dir "$dir/results"

    if not test -d $dir
        mkdir -p $query_dir $results_dir
    end

    set -l connection (
        if set -q _flag_connection
            echo $_flag_connection
        else
            echo 'local'
        end
    )

    set -l host (
        switch $connection
            case 'live'
                echo 'host:port'
            case 'local' '*'
                echo 'localhost:9200'
        end
    )

    if test -z "$action"
        set action 'health'
    end

    switch $action
        case 'cd'
            _es_cd $argv
        case 'health' 'h'
            _es_health $argv
        case 'indices' 'i'
            _es_indices $argv
        case 'query' 'q'
            _es_query $argv
        case 'search' 's'
            _es_search $argv
    end
end

function _es_cd -S
    eval "cd $dir"
end

function _es_health -S
    eval "curl -X GET '$host/_cat/health'"
end

function _es_indices -S
    eval "curl -X GET '$host/_cat/indices'"
end

function _es_results -S -a name
    eval "$EDITOR $results_dir/$name-$connection.json"
end

function _es_query -S -a name
    if set -q _flag_delete
        eval "rm $query_dir/$name.json"
    else if set -q _flag_results
        _es_results $name
    else if [ "$name" = "ls" ]
        eval "ls $query_dir | sed 's/\.json//'"
    else
        eval "$EDITOR $query_dir/$name.json"
    end
end

function _es_search -S -a query
    set -l params (
        if set -q _flag_params
            echo $_flag_params
        else
            echo 'pretty'
        end
    )

    set -l header (
        if set -q _flag_header
            echo $_flag_header
        else
            echo 'Content-Type:application/json'
        end
    )

    set -l data "$query_dir/$query.json"
    set -l output "$results_dir/$query-$connection.json"
    set -l command "curl -X GET '$host/$index/_search?$params' -H $header -d @$data -o $output"

    if set -q _flag_print
        printf "$command\n"
    else
        eval $command
        _es_results $query
    end
end
