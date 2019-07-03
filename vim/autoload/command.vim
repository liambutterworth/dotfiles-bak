"
" Command
"

function! command#execute(command) abort
    return substitute(system(a:command), '\n', '', 'g')
endfunction

function! command#exists(command) abort
    return !empty(system('command -v ' . a:command))
endfunction

function! command#branch() abort
    if plugin#exists('vim-fugitive')
        return fugitive#head()
    endif
endfunction

function! command#permissions() abort
    if !exists('s:permissions')
        let s:permissions = ''
        autocmd bufleave * let s:permissions = ''
    elseif !empty(s:permissions)
        return s:permissions
    elseif filereadable(expand('%:p'))
        let s:permissions = command#execute(
            \ 'ls -lad ' . expand('%:p:h') . '/*' .
            \ ' | grep ' . expand('%:p') .
            \ ' | cut -d " " -f1'
            \ )

        return s:permissions
    endif
endfunction
