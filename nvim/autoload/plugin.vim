"
" Plugin
"

function! plugin#exists(plugin) abort
    return isdirectory($HOME . '/.config/nvim/plugged')
        \ && has_key(g:plugs, a:plugin)
endfunction
