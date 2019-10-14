"
" Close
"

function! close#smart() abort
    if winnr('$') > 1 || tabpagenr() > 1
        exec buffer_name() ? 'bwipeout' : 'close'
    elseif len(getbufinfo({ 'buflisted': 1 })) > 1 || &filetype == 'help'
        exec 'bwipeout'
    else
        exec 'quit'
    endif
endfunction
