"
" Interface
"

function! ui#StatusLine()
    let output = ' '

    let output .= '%f%m'
    let output .= '%='
    let output .= '%c:%l/%L'
    let output .= ' %{&fileencoding}'
    let output .= ' %{&fileformat}'

    return output . ' '
endfunction

function! ui#TabLine()
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
