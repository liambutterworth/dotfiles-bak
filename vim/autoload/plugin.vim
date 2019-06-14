"
" Plugin
"
" :: Load
" :: Exists

"
" Load
"

function plugin#load()
    if filereadable($HOME . '/.vim/autoload/pathogen.vim')
        execute pathogen#infect($HOME . '/.vim/plugins/{}')
        call pathogen#helptags()
    endif
endfunction

"
" Exists
"

function! plugin#exists(plugin)
    return &runtimepath =~ a:plugin
endfunction
