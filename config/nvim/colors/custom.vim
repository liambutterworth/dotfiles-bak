"
" Custom Theme
"

set background=dark
set statusline=\ %f\ %h%m%r%=%-14.(%l,%c%V%)\ %P\ 

highlight clear

highlight Constant ctermfg=green
highlight Comment cterm=bold ctermfg=black
highlight CursorLine cterm=none ctermbg=black
highlight CursorLineNr ctermbg=none ctermfg=white
highlight DiffAdd cterm=bold ctermbg=green ctermfg=black
highlight DiffChange cterm=bold ctermbg=yellow ctermfg=black
highlight DiffDelete cterm=bold ctermbg=red ctermfg=black
highlight DiffText cterm=bold ctermbg=red ctermfg=black
highlight Error cterm=bold ctermbg=none ctermfg=red
highlight Folded ctermbg=black ctermfg=white
highlight FoldColumn ctermbg=black ctermfg=white
highlight Identifier cterm=none ctermfg=cyan
highlight LineNr cterm=bold ctermfg=black
highlight MatchParen cterm=bold ctermbg=none ctermfg=yellow
highlight MatchTag ctermfg=yellow
highlight NonText cterm=bold ctermbg=none ctermfg=black
highlight Normal ctermbg=none
highlight Number ctermfg=magenta
highlight Operator ctermfg=blue
highlight Pmenu ctermbg=black ctermfg=white
highlight PmenuSel cterm=bold ctermbg=black ctermfg=white
highlight PmenuSbar ctermbg=black
highlight PmenuThumb cterm=bold ctermbg=white ctermfg=black
highlight PreProc cterm=none ctermfg=blue
highlight Question ctermfg=yellow
highlight SignColumn ctermbg=none ctermfg=white
highlight Special ctermfg=blue
highlight SpecialChar ctermfg=yellow
highlight SpellBad cterm=bold ctermbg=red ctermfg=black
highlight SpellCap cterm=bold ctermbg=yellow ctermfg=black
highlight SpellRare cterm=bold ctermbg=magenta ctermfg=black
highlight SpellLocal cterm=bold ctermbg=cyan ctermfg=black
highlight Statement ctermfg=blue
highlight StatusLine cterm=none ctermbg=black ctermfg=white
highlight StatusLineNc cterm=none ctermbg=black ctermfg=white
highlight Title cterm=bold ctermfg=cyan
highlight Todo ctermbg=none ctermfg=yellow
highlight Type ctermfg=white
highlight Underlined ctermfg=cyan
highlight VertSplit cterm=bold ctermbg=black
highlight Visual cterm=bold ctermbg=black
highlight WarningMsg ctermbg=none ctermfg=yellow

"
" NerdTree
"

highlight NERDTreeClosable ctermfg=magenta
highlight NERDTreeOpenable ctermfg=magenta
highlight NERDTreeDir cterm=none ctermfg=cyan
highlight NERDTreeFlags ctermfg=blue

"
" GitGutter
"

highlight GitGutterAdd ctermfg=green
highlight GitGutterChange ctermfg=yellow
highlight GitGutterDelete ctermfg=red

"
" LSP
"

highlight LspDiagnosticsDefaultError ctermfg=red
highlight LspVirtualFloatingError ctermfg=red
highlight LspVirtualSignError ctermfg=red
highlight LspVirtualTextError ctermfg=red
highlight LspDiagnosticsDefaultWarning ctermfg=yellow
highlight LspVirtualFloatingWarning ctermfg=yellow
highlight LspVirtualSignWarning ctermfg=yellow
highlight LspVirtualTextWarning ctermfg=yellow
highlight LspDiagnosticsDefaultInformation ctermfg=blue
highlight LspVirtualFloatingInformation ctermfg=blue
highlight LspVirtualSignInformation ctermfg=blue
highlight LspVirtualTextInformation ctermfg=blue

"
" Lua
"

highlight link luaFuncKeyword Operator
highlight link luaLocal Operator

"
" Vim
"

highlight link vimHiAttrib Number
highlight link vimHiCterm Special
highlight link vimHiCtermColor vimHiAttrib
highlight link vimHiCtermFgBg vimHiCterm
highlight link vimHiGuiColor vimHiCtermColor
highlight link vimHiGuiFgBg vimHiCtermFgBg
highlight link vimParenSep Type
highlight link vimSep Type
highlight link vimSetSep Type

"
" HTML
"

highlight link htmlArg Identifier
highlight link htmlEndTag htmlTagName
highlight link htmlTag htmlTagName

"
" CSS
"

highlight link cssBackgroundProp Keyword
highlight link cssBorderAttr Number
highlight link cssBorderProp Keyword
highlight link cssBraces Type
highlight link cssBoxProp Keyword
highlight link cssFlexibleBoxProp Keyword
highlight link cssColor Number
highlight link cssCommonAttr Number
highlight link cssFontProp Keyword
highlight link cssMediaProp Keyword
highlight link cssPageProp Keyword
highlight link cssPositioningAttr Number
highlight link cssPositioningProp Keyword
highlight link cssPseudoClassId Identifier
highlight link cssTextProp Keyword
highlight link cssTransitionAttr Number
highlight link cssTransitionProp Keyword
highlight link cssUIProp Keyword
highlight link cssUIAttr Number
highlight link cssUnicodeEscape SpecialChar

"
" SCSS
"

highlight link scssAmpersand scssSelectorName
highlight link scssSemicolon Type

"
" JS
"

highlight link javaScript Keyword
highlight link jsBuiltins Identifier
highlight link jsGlobalObjects Type
highlight link jsStorageClass Keyword
highlight link jsUndefined Keyword
highlight link jsBooleanFalse Number
highlight link jsBooleanTrue Number

"
" Vue
"

highlight link vueSurroundingTag htmlTag

"
" PHP
"

highlight link phpFunction phpFunctions
highlight link phpIdentifier Type
highlight link phpMethod phpMethods
highlight link phpParent Type
highlight link phpStaticClasses Title
highlight link phpType Keyword
