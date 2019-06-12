function! plugin#exists(plugin)
    return &runtimepath =~ a:plugin
endfunction
