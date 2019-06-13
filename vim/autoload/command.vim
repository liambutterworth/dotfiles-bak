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
    if !empty(system('git rev-parse --git-dir 2>/dev/null'))
        let branch = system('git rev-parse --abbrev-ref HEAD')
        return command#clean(branch)
    endif
endfunction

"
" Permissions
"

function! command#permissions() abort
    let dir = expand('%:h')
    let file = expand('%:t')

    if filereadable(dir . '/' . file)
        let permissions = system(
            \ 'ls -la ' . dir .
            \ ' | grep ' . file .
            \ ' | cut -d " " -f1'
            \ )

        return command#clean(permissions)
    endif
endfunction

" let s:permissions =

" function! command#permissions() abort
"     if empty(s:permissions)
"         let dir = expand('%:h')
"         let file = expand('%:t')

"         if filereadable(dir . '/' . file)
"             let permissions = system(
"                 \ 'ls -la ' . dir .
"                 \ ' | grep ' . file .
"                 \ ' | cut -d " " -f1'
"                 \ )

"             set s:permissions = command#clean(permissions)
"         endif
"     endif

"     return s:permissions
" endfunction
