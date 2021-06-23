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
        execute buffer_name() ? 'bwipeout' : 'close'
    elseif len(getbufinfo({ 'buflisted': 1 })) > 1 || &filetype == 'help'
        execute 'bwipeout'
    else
        execute 'quit'
    endif

    if using_nerd_tree
        execute 'NERDTreeToggle'
        call feedkeys("\<C-w>p")
    endif
endfunction
