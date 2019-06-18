"
" Command
"
" :: Execute
" :: Exists
" :: Branch
" :: Permissions

"
" Execute
"

function! command#execute(command) abort
    return substitute(system(a:command), '\n', '', 'g')
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

autocmd bufleave * let s:permissions = ''

function! command#permissions() abort
    if exists('s:permissions') && !empty(s:permissions)
        return s:permissions
    elseif filereadable(expand('%:p'))
        let s:permissions = command#execute(
            \ 'ls -la ' . expand('%:h') .
            \ ' | grep ' . expand('%:t') .
            \ ' | cut -d " " -f1'
            \ )

        return s:permissions
    endif
endfunction
