"
" Vim Config
"
" :: Settings
" :: Highlights
" :: Statusline
" :: Commands
" :: Mappings

"
" Settings
"

execute pathogen#infect()
runtime macros/matchit.vim
colorscheme base16-gruvbox-dark-medium
filetype plugin indent on
syntax on

let g:mapleader                               = ' '
let g:ale_sign_warning                        = '▸'
let g:ale_sign_error                          = '▸'
let g:gitgutter_map_keys                      = 0
let g:splitjoin_trailing_comma                = 1
let g:fzf_tags_command                        = 'git ctags'
let g:user_emmet_leader_key                   = '<c-x>'
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_key_list_select_completion          = ['<c-n>']
let g:ycm_key_list_previous_completion        = ['<c-p']
let g:UltiSnipsSnippetDirectories             = [$HOME.'/.vim/snips']

set lazyredraw
set autoindent
set cursorline
set rtp+=~/.fzf
set laststatus=2
set signcolumn=yes
set tags=.git/tags
set fillchars+=vert:│
set incsearch ignorecase
set splitright splitbelow
set backspace=indent,eol,start
set ruler number relativenumber
set list listchars=tab:│\ ,trail:·
set wildmenu wildmode=list:longest
set tabstop=4 shiftwidth=4 expandtab
set nowrap novisualbell nobackup noswapfile
set foldenable foldmethod=syntax foldlevelstart=20

"
" Highlights
"

exe 'hi Pmenu ctermbg='                . base16_cterm00
exe 'hi PmenuSel ctermbg='             . base16_cterm03 . ' ctermfg=' . base16_cterm05
exe 'hi TabLine ctermbg='              . base16_cterm00 . ' ctermfg=' . base16_cterm03
exe 'hi TabLineSel ctermbg='           . base16_cterm00 . ' ctermfg=' . base16_cterm05
exe 'hi TabLineFill ctermbg='          . base16_cterm00
exe 'hi LineNr ctermbg='               . base16_cterm00
exe 'hi CursorLine ctermbg='           . base16_cterm00
exe 'hi CursorLineNr ctermbg='         . base16_cterm00 . ' ctermfg=' . base16_cterm05
exe 'hi StatusLineText ctermfg='       . base16_cterm03
exe 'hi StatusLineNC ctermbg='         . base16_cterm03 . ' ctermfg=' . base16_cterm03
exe 'hi VertSplit ctermbg='            . base16_cterm00 . ' ctermfg=' . base16_cterm03
exe 'hi AleErrorSign ctermbg='         . base16_cterm00 . ' ctermfg=' . base16_cterm08
exe 'hi AleWarningSign ctermbg='       . base16_cterm00 . ' ctermfg=' . base16_cterm0D
exe 'hi GitGutterAdd ctermbg='         . base16_cterm00
exe 'hi GitGutterChange ctermbg='      . base16_cterm00
exe 'hi GitGutterDelete ctermbg='      . base16_cterm00
exe 'hi GitGutterChangeDelete ctermbg='. base16_cterm00

"
" Statusline
"

set statusline  =%#StatusLineText#
set statusline +=\ %{empty(fugitive#head(7))?'':fugitive#head(7).'\ '}%f%M
set statusline +=%=
set statusline +=%{&fileformat}
set statusline +=\ %{&fileencoding?&fileencoding:&encoding}
set statusline +=\ %l:%c
set statusline +=\ %p%%
set statusline +=\ %#End#

"
" Commands
"

autocmd CompleteDone * pclose
autocmd filetype * set formatoptions-=o
autocmd filetype scss.css setlocal commentstring=/*%s*/
autocmd bufread,bufnewfile *.css set filetype=scss.css

augroup completion
    autocmd!
    autocmd filetype markdown setlocal spell complete+=kspell
    autocmd filetype html setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd filetype css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd filetype javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd filetype php setlocal omnifunc=phpcomplete#CompletePHP
augroup END

"
" Mappings
"

nmap Y y$
nmap j gj
nmap k gk

nmap <c-w>< <c-w>10<
nmap <c-w>> <c-w>10>
nmap <c-w>- <c-w>10-
nmap <c-w>+ <c-w>10+

nmap gP :tabm -1<cr>
nmap gN :tabm +1<cr>
xmap ga <plug>(EasyAlign)
nmap ga <plug>(EasyAlign)

imap <c-x>o <cr><esc>O
imap <c-x><bs> <esc>ddk:s/\s\+$//e<cr>$gJa
imap <c-x>, <esc>m`:s/\v(.)$/\=submatch(1)==','?'':submatch(1).','<cr>``a
imap <c-x>; <esc>m`:s/\v(.)$/\=submatch(1)==';'?'':submatch(1).';'<cr>``a

nmap <leader><space> :Files<cr>
nmap <leader>t :Tags<cr>
nmap <leader>T :BTags<cr>
nmap <leader>h :History<cr>
nmap <leader>a :Ag<cr>
nmap <leader>g :GFiles<cr>
nmap <leader>c :Commits<cr>
nmap <leader>C :BCommits<cr>
