let s:branch = command#branch()
let s:permissions = command#permissions()

function! interface#StatusLine()
    let output = ' '

    let output .= '%f%m'
    let output .= !empty(s:branch) ? ' ' . s:branch : ''
    let output .= '%=%c:%l/%L %{&fileformat}'
    let output .= filereadable(expand('%:p')) ? ' %{&fileencoding}' : ''
    let output .= !empty(s:permissions) ? ' ' . s:permissions : ''

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
