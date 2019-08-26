"
" Command
"

function! command#execute(command) abort
    return substitute(system(a:command), '\n', '', 'g')
endfunction

function! command#exists(command) abort
    return !empty(system('command -v ' . a:command))
endfunction
