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

let g:mapleader = ' '
let g:ale_sign_warning = '▸'
let g:ale_sign_error = '▸'
let g:jsx_ext_required = 0
let g:gitgutter_map_keys = 0
let g:fzf_tags_command = 'git ctags'

set lazyredraw
set autoindent
set cursorline
set laststatus=2
set signcolumn=yes
set fillchars+=vert:│
set rtp+=~/.fzf
set incsearch ignorecase
set splitright splitbelow
set backspace=indent,eol,start
set ruler number relativenumber
set list listchars=tab:│\ ,trail:·
set wildmenu wildmode=list:longest
set tabstop=2 shiftwidth=2 noexpandtab
set nowrap novisualbell nobackup noswapfile
set foldenable foldmethod=syntax foldlevelstart=20

"
" Highlights
"

exe 'hi Pmenu ctermbg=' . base16_cterm00
exe 'hi PmenuSel ctermbg=' . base16_cterm03 . ' ctermfg=' . base16_cterm05
exe 'hi TabLine ctermbg=' . base16_cterm00 . ' ctermfg=' . base16_cterm03
exe 'hi TabLineSel ctermbg=' . base16_cterm00 . ' ctermfg=' . base16_cterm05
exe 'hi TabLineFill ctermbg=' . base16_cterm00
exe 'hi LineNr ctermbg=' . base16_cterm00
exe 'hi CursorLine ctermbg=' . base16_cterm00
exe 'hi CursorLineNr ctermbg=' . base16_cterm00 . ' ctermfg=' . base16_cterm05
exe 'hi StatusLineText ctermfg=' . base16_cterm03
exe 'hi StatusLineNC ctermbg=' . base16_cterm03 . ' ctermfg=' . base16_cterm03
exe 'hi VertSplit ctermbg=' . base16_cterm00 . ' ctermfg=' . base16_cterm03
exe 'hi AleErrorSign ctermbg=' . base16_cterm00 . ' ctermfg=' . base16_cterm08
exe 'hi AleWarningSign ctermbg=' . base16_cterm00 . ' ctermfg=' . base16_cterm0D
exe 'hi GitGutterAdd ctermbg=' . base16_cterm00
exe 'hi GitGutterChange ctermbg=' . base16_cterm00
exe 'hi GitGutterDelete ctermbg=' . base16_cterm00
exe 'hi GitGutterChangeDelete ctermbg=' . base16_cterm00

"
" Statusline
"

set statusline =%#StatusLineText#
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

nmap <leader><space> :Files<cr>
nmap <leader>ft :Tags<cr>
nmap <leader>fT :BTags<cr>
nmap <leader>fh :History<cr>
nmap <leader>fa :Ag<cr>
nmap <leader>fg :GFiles<cr>
nmap <leader>gc :Commits<cr>
nmap <leader>gC :BCommits<cr>
nmap <leader>gs :Gstatus<cr>
nmap <leader>gd :Gdiff<cr>
nmap <leader>gl :Glog<cr>
nmap <leader>gb :Gblame<cr>
nmap <leader>gt :Git ctags<cr>

imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

imap <c-e>, <esc>m`:s/\v(.)$/\=submatch(1)==','?'':submatch(1).','<cr>``a
imap <c-e>; <esc>m`:s/\v(.)$/\=submatch(1)==';'?'':submatch(1).';'<cr>``a
