"
" Functions
"
" :: Command Exists
" :: Plugin Exists
" :: Status Line
" :: Tab Line

"
" Command Exists
"

function! functions#CommandExists(command)
    return !empty(system('command -v ' . a:command))
endfunction

"
" Plugin Exists
"

function! functions#PluginExists(plugin)
    return &runtimepath =~ a:plugin
endfunction

"
" Status Line
"

let s:git_branch = substitute(system(
    \ 'git rev-parse --git-dir >/dev/null 2>&1 && git rev-parse --abbrev-ref HEAD'
    \ ), '\n', '', 'g')

let s:file_permissions = substitute(system(
    \ 'ls -la ' . expand('%:h')
    \ . ' | grep ' . expand('%:t')
    \ . ' | cut -d " " -f1'
    \ ), '\n', '', 'g')

function! functions#StatusLine()
    let output = ' '

    let output .= '%f%m'
    let output .= !empty(s:git_branch) ? ' ' . s:git_branch : ''
    let output .= '%=%c:%l/%L %{&fileformat}'
    let output .= filereadable(expand('%:p')) ? ' %{&fileencoding}' : ''
    let output .= !empty(s:file_permissions) ? ' ' . s:file_permissions : ''

    return output . ' '
endfunction

"
" Tab Line
"

function! functions#TabLine()
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
