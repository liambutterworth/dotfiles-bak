"
" Custom Theme
"

set background=dark
set statusline=\ %f\ %h%m%r%=%-14.(%l,%c%V%)\ %P%%\ 

highlight clear

highlight Constant ctermfg=green
highlight Comment cterm=bold ctermfg=black
highlight CursorLineNr ctermbg=none ctermfg=white
highlight DiffAdd cterm=bold ctermbg=green ctermfg=black
highlight DiffChange cterm=bold ctermbg=yellow ctermfg=black
highlight DiffDelete cterm=bold ctermbg=red ctermfg=black
highlight DiffText cterm=bold ctermbg=red ctermfg=black
highlight Error cterm=bold ctermbg=none ctermfg=red
highlight Folded ctermbg=black ctermfg=white
highlight FoldColumn ctermbg=black ctermfg=white
highlight Identifier cterm=bold ctermfg=cyan
highlight LineNr cterm=bold ctermfg=black
highlight MatchParen cterm=bold ctermbg=none ctermfg=yellow
highlight NonText cterm=bold ctermbg=none ctermfg=black
highlight Normal ctermbg=none
highlight Number ctermfg=magenta
highlight Operator ctermfg=blue
highlight Pmenu ctermbg=black ctermfg=white
highlight PmenuSel cterm=bold ctermbg=black ctermfg=white
highlight PmenuSbar ctermbg=black
highlight PmenuThumb cterm=bold ctermbg=white ctermfg=black
highlight PreProc ctermfg=blue
highlight Question ctermfg=yellow
highlight SignColumn ctermbg=none ctermfg=white
highlight Special ctermfg=blue
highlight SpecialChar ctermfg=yellow
highlight SpellBad cterm=bold ctermbg=red ctermfg=black
highlight SpellCap cterm=bold ctermbg=yellow ctermfg=black
highlight SpellRare cterm=bold ctermbg=magenta ctermfg=black
highlight SpellLocal cterm=bold ctermbg=cyan ctermfg=black
highlight Statement cterm=bold ctermfg=blue
highlight Title cterm=bold ctermfg=cyan
highlight Todo ctermbg=none ctermfg=yellow
highlight Type ctermfg=white
highlight Underlined ctermfg=cyan
highlight Visual ctermbg=black
highlight WarningMsg ctermbg=none ctermfg=yellow

highlight VertSplit ctermbg=none ctermfg=black

" highlight VertSplit ctermbg=none
highlight StatusLine cterm=none ctermbg=black ctermfg=white
highlight StatusLineNc cterm=none ctermbg=black ctermfg=white

"
" Vim
"

highlight link vimHiCterm Special
highlight link vimHiAttrib Number
highlight link vimHiCtermFgBg vimHiCterm
highlight link vimHiGuiFgBg vimHiCtermFgBg
highlight link vimHiCtermColor vimHiAttrib
highlight link vimHiGuiColor vimHiCtermColor
highlight link vimParenSep Type
highlight link vimSep Type
highlight link vimSetSep Type

"
" GitGutter
"

highlight GitGutterAdd ctermfg=green
highlight GitGutterChange ctermfg=yellow
highlight GitGutterDelete ctermfg=red

"
" LSP
"

" highlight LspDiagnosticsDefaultError guifg=#bf616a
" highlight LspVirtualFloatingError guifg=#bf616a
" highlight LspVirtualSignError guifg=#bf616a
" highlight LspVirtualTextError guifg=#bf616a
" highlight LspDiagnosticsDefaultWarning guifg=#ebcb8b
" highlight LspVirtualFloatingWarning guifg=#ebcb8b
" highlight LspVirtualSignWarning guifg=#ebcb8b
" highlight LspVirtualTextWarning guifg=#ebcb8b
" highlight LspDiagnosticsDefaultInformation guifg=#a3be8c
" highlight LspVirtualFloatingInformation guifg=#a3be8c
" highlight LspVirtualSignInformation guifg=#a3be8c
" highlight LspVirtualTextInformation guifg=#a3be8c
