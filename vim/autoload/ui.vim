"
" Interface
"
" :: Status Line
" :: Tab Line

"
" Status Line
"

function! ui#coctest() abort
    let info = get(b:, 'coc_diagnostic_info', {})
    return info
endfunction

function! ui#cocstatus() abort
    let info = get(b:, 'coc_diagnostic_info', {})
    let output = []

    if get(info, 'error', 0)
        call add(output, 'E' . info['error'])
    endif

    if get(info, 'hint', 0)
        call add(output, 'H' . info['hint'])
    endif

    if get(info, 'warning', 0)
        call add(output, 'W' . info['warning'])
    endif

    return empty(output) ? '' : join(output, ' ')
endfunction

function! ui#statusline() abort
    let output = ' '
    let output .= '%f%M%R%H%W'
    let output .= '%='
    let output .= ui#cocstatus()
    let output .= ' %c:%l/%L'

    return output . ' '
endfunction

"
" Tab Line
"

function! ui#tabline() abort
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
