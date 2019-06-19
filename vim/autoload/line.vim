"
" Ender
"
" :: Ender
" :: Move

"
" Ender
"

function! line#ender(char) abort
    s/\v(.)$/\=submatch(1) == a:char ? '' : submatch(1) . a:char
endfunction

"
" Move
"

function! line#nmoveup(count) abort
    execute 'm-' . (a:count + 1)
    normal ==
endfunction

function! line#nmovedown(count) abort
    execute 'm+' . a:count
    normal ==
endfunction

function! line#vmoveup(count) abort
    execute "'<,'>m-" . (a:count + 1)
    normal gv=gv
endfunction

function! line#vmovedown(count) abort
    execute "'<,'>m'>+" . a:count
    normal gv=gv
endfunction
