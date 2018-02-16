function! Ender(char)
  s/\v(.)$/\=submatch(1)==a:char ? '' : submatch(1).a:char
endfunction

inoremap ,, <esc>m`:call Ender(',')<cr>``a
inoremap ;; <esc>m`:call Ender(';')<cr>``a
