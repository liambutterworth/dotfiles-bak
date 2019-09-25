"
" Line
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

function! line#move(mode, direction, count) abort
    let l:range = a:mode == 'v' ? "'<,'>" : ''
    let l:command = 'm' . (a:mode == 'v' && a:direction == 'down' ? "'>" : '')
    let l:symbol = a:direction == 'up' ? '-' : '+'
    let l:count = (a:count == 0 ? 1 : a:count) + (a:direction == 'up' ? 1 : 0)

    silent execute l:range . l:command . l:symbol . l:count
    silent execute 'normal! ' . (a:mode == 'n' ? '==' : 'gv=gv')
endfunction
