" if g:vim_plugged && has_key(g:plugs, 'lexima.vim')
"     call lexima#add_rule({
"         \ 'char': '>',
"         \ 'at': '<.*\%#',
"         \ 'input': '></><esc>2T<yef/pF>a',
"         \ 'except': '".*\%#.*"'
"         \ })

"     call lexima#add_rule({
"         \ 'char': '<cr>',
"         \ 'at': '>\%#<',
"         \ 'input': '<cr><esc>O'
"         \ })

"     call lexima#add_rule({
"         \ 'char': '<bs>',
"         \ 'at': '<.*>\%#\s*</.*>',
"         \ 'input': '<esc>df>a'
"         \ })

"     call lexima#add_rule({
"         \ 'char': '<bs>',
"         \ 'at': '<.*>\n\%#',
"         \ 'input': '<esc>ddd0i<bs>'
"         \ })
" endif
