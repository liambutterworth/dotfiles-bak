if g:vim_plugged && has_key(g:plugs, 'lexima.vim')
    let blade_blocks = [
        \ 'for',
        \ 'foreach',
        \ 'if',
        \ 'section',
        \ ]

    for block in blade_blocks
        call lexima#add_rule({
            \ 'char': '<cr>',
            \ 'at': '@' . block . '.*\%#\s*$',
            \ 'input': '<cr>@end' . block . '<esc>O',
            \ 'except': '@' . block . '.*\%#$\n*\s*@end' . block,
            \ })

        call lexima#add_rule({
            \ 'char': '<bs>',
            \ 'at': '@' . block . '.*\n\%#\s*\n\s*@end' . block,
            \ 'input': '<esc>dd0C<bs>',
            \ })
    endfor
endif
