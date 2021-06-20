"
" Close
"

function! close#smart() abort
    let using_nerd_tree = exists('t:NERDTreeBufName')
        \ && bufwinnr(t:NERDTreeBufName) != -1

    if using_nerd_tree
        execute 'NERDTreeToggle'
    endif

    if winnr('$') > 1 || tabpagenr() > 1
        exec buffer_name() ? 'bwipeout' : 'close'
    elseif len(getbufinfo({ 'buflisted': 1 })) > 1 || &filetype == 'help'
        exec 'bwipeout'
    else
        exec 'quit'
    endif

    if using_nerd_tree
        execute 'NERDTreeToggle'
    endif
endfunction
