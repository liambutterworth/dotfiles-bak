if g:vim_plugged && has_key(g:plugs, 'lexima.vim')
    call lexima#add_rule({
        \'char': '<', 
        \ 'input_after': '>'
        \ })

    call lexima#add_rule({
        \ 'char': '>',
        \ 'at': '\%#>',
        \ 'leave': 1
        \ })

    call lexima#add_rule({
        \ 'char': '<BS>',
        \ 'at': '<.*>\%#',
        \ 'input': '<BS>',
        \ 'input_after': '>'
        \ })

    call lexima#add_rule({
        \ 'char': '<BS>',
        \ 'at': '<.*/>\%#',
        \ 'input': '<BS><BS>',
        \ 'input_after': '/>',
        \ 'priority': 1
        \ })

    call lexima#add_rule({
        \ 'char': '/',
        \ 'leave': 2,
        \ 'at': '^\s*<.*\%#\s*/>'
        \ })

    call lexima#add_rule({
        \ 'char': '<BS>',
        \ 'delete': 1,
        \ 'at': '<\%#>'
        \ })

    call lexima#add_rule({
        \ 'char': '<BS>',
        \ 'delete': 2,
        \ 'at': '<\%#/>',
        \ 'priority': 1
        \ })

    call lexima#add_rule({
        \ 'char': '/',
        \ 'delete': 1,
        \ 'input': '/>',
        \ 'at': '<[^>]\+\%#>'
        \ })

    call lexima#add_rule({
        \ 'char': '<CR>',
        \ 'input': '<CR>',
        \ 'input_after': '<CR>',
        \ 'at': '>\%#</'
        \ })
endif
