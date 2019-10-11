"
" Close
"

function! close#smart() abort
    if winnr('$') > 1 || tabpagenr() > 1
        if buffer_name() == ''
            exec 'bwipeout'
        else
            exec 'close'
        endif
    elseif len(getbufinfo({ 'buflisted': 1 })) > 1
        exec 'bwipeout'
    else
        exec 'quit'
    endif
endfunction
