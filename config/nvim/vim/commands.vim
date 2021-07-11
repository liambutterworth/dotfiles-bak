autocmd FileType * setlocal formatoptions-=o
autocmd TermOpen * setlocal nonumber norelativenumber | startinsert
autocmd BufEnter * if &buftype == 'terminal' | :startinsert | endif
