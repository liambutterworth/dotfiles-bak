function db -a action
    # set cmd (commandline -opc)
    # echo $cmd

    set -l dir "$HOME/.config/db"
    set -l query_dir "$dir/query"
    set -l options

    set options $options (fish_opt -s c -l connection -r)
    set options $options (fish_opt -s d -l database -r)
    set options $options (fish_opt -s e -l edit)
    set options $options (fish_opt -s m -l move -r)
    set options $options (fish_opt -s r -l remove)

    argparse $options -- $argv

    set -l connection (set -q _flag_c; and echo $_flag_c; or echo 'docker')
    set -l database (set -q _flag_d; and echo $_flag_d; or echo 'recruiting')

    set -e argv[1]
    mkdir -p $query_dir

    switch $action
        case 'cd'
            _db_cd $argv
        case 'query' 'q'
            _db_query $argv
    end
end

function _db_cd -S
    cd $dir
end

function _db_query -S -a name
    set -l query $query_dir/$name.sql

    if [ $name = 'ls' ]
        ls $query_dir | sed 's/\.sql//'
    else if set -q _flag_edit
        $EDITOR $query
    else if not test -f $query
        printf "query $name does not exist\n"
    else if set -q _flag_move
        mv $query $query_dir/$_flag_move.sql
    else if set -q _flag_remove
        rm $query
    else
        mysql --login-path=$connection --vertical $database < $query
    end
end
