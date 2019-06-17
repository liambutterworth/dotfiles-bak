"
" Command
"
" :: Clean
" :: Exists
" :: Branch
" :: Permissions

"
" Clean
"

function! command#clean(output) abort
    return substitute(a:output, '\n', '', 'g')
endfunction

"
" Exists
"

function! command#exists(command) abort
    return !empty(system('command -v ' . a:command))
endfunction

"
" Branch
"

function! command#branch() abort
    if plugin#exists('vim-fugitive')
        return fugitive#head()
    endif
endfunction

"
" Permissions
"

let s:permissions = ''
autocmd bufleave * let s:permissions = ''

function! command#permissions() abort
    if empty(s:permissions) && filereadable(expand('%:p'))
        let permissions = system(
            \ 'ls -la ' . expand('%:h') .
            \ ' | grep ' . expand('%:t') .
            \ ' | cut -d " " -f1'
            \ )

        let s:permissions = command#clean(permissions)
    endif

    return s:permissions
endfunction
