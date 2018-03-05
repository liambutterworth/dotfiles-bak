function! Ender(char)
  s/\v(.)$/\=submatch(1)==a:char ? '' : submatch(1).a:char
endfunction

inoremap <c-e>, <esc>m`:call Ender(',')<cr>``a
inoremap <c-e>; <esc>m`:call Ender(';')<cr>``a
