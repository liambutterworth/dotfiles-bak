function es -a action
    set -l dir "$HOME/.config/es"
    set -l query_dir "$dir/query"
    set -l output "$dir/results.json"
    set -l header 'Content-Type:application/json'
    set -l options

    set options $options (fish_opt -s c -l connection -r)
    set options $options (fish_opt -s d -l delete)
    set options $options (fish_opt -s e -l edit)
    set options $options (fish_opt -s i -l index -r)
    set options $options (fish_opt -s p -l params -r)

    argparse $options -- $argv

    set -l connection (set -q _flag_c; and echo $_flag_c; or echo 'local')
    set -l index (set -q _flag_i; and echo $_flag_i; or echo 'jobs/item')
    set -l params (set -q _flag_p; and echo $_flag_p; or echo 'pretty')

    set -l host 'http://'(
        switch $connection
            case 'live'
                echo 'host:port'
            case 'local' '*'
                echo 'localhost:9200'
        end
    )

    set -e argv[1]
    mkdir -p $query_dir

    switch $action
        case 'cd'
            _es_cd $argv
        case 'health' 'h'
            _es_health $argv
        case 'indices' 'i'
            _es_indices $argv
        case 'query' 'q'
            _es_query $argv
        case 'results' 'r'
            _es_results $argv
    end
end

function _es_cd -S
    cd $dir
end

function _es_health -S
    curl -XGET $host/_cat/health
end

function _es_indices -S
    curl -XGET $host/_cat/indices
end

function _es_query -S -a name
    set -l query "$query_dir/$name.json"

    if set -q _flag_edit
        $EDITOR $query
    else if set -q _flag_delete
        rm $query
    else if [ $name = 'ls' ]
        ls $query_dir | sed 's/\.json//'
    else if not test -f $query
        printf "query $name does not exist\n"
    else
        curl -XGET $host/$index/_search?$params -H $header -d @$query -o $output
        _es_results
    end
end

function _es_results -S
    $EDITOR $output
end
