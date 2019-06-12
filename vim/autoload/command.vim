function! command#exists(command) abort
    return !empty(system('command -v ' . a:command))
endfunction

function! command#branch() abort
    if !empty(system('git rev-parse --git-dir 2>/dev/null'))
        let branch = system('git rev-parse --abbrev-ref HEAD')
        return command#clean(branch)
    endif
endfunction

function! command#permissions() abort
    let directory = expand('%:h')
    let filename = expand('%:t')

    let permissions = system(
        \ 'ls -la ' . directory .
        \ ' | grep ' . filename .
        \ ' | cut -d " " -f1'
        \ )

    return command#clean(permissions)
endfunction

function! command#clean(output) abort
    return substitute(a:output, '\n', '', 'g')
endfunction
