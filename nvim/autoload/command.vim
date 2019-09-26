"
" Command
"

function command#execute(command)
    return substitute(system(a:command), '\n', '', 'g')
endfunction

function! command#exists(command) abort
    return executable(a:command)
endfunction
