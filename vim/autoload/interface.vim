"
" Interface
"

function! interface#StatusLine()
    let output = ' '
    let branch = command#branch()
    let permissions = command#permissions()

    let output .= '%f%m'
    let output .= !empty(branch) ? ' ' . branch : ''
    let output .= '%=%c:%l/%L'

    if plugin#exists('ale')
        let ale = ale#statusline#Count(bufnr(''))
        let errors = ale.error
        let warnings = ale.total - errors

        let output .= ' '
            \ . errors . 'e'
            \ . ' '
            \ . warnings . 'w'
    endif

    let output .= !empty(permissions) ? ' ' . permissions : ''

    return output . ' '
endfunction

function! interface#TabLine()
    let output = ''

    for index in range(tabpagenr('$'))
        let tab_index = index + 1
        let buflist = tabpagebuflist(tab_index)
        let winnr = tabpagewinnr(tab_index)
        let tab_name = fnamemodify(bufname(buflist[winnr - 1]), ':t')
        let tab_highlight = (tab_index == tabpagenr() ? '%#TabLineSel#' : '%#TabLine#')

        let output .= tab_highlight . ' ' . tab_name . ' '
    endfor

    return output . '%#TabLineFill#%T'
endfunction
