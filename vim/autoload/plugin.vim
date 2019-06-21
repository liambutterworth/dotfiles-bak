"
" Plugin
"

function! plugin#exists(plugin)
    return !empty(system('ls $HOME/.vim/pack/plugins/start/' . a:plugin))
endfunction
