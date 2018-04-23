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
colorscheme base16-ocean
filetype plugin indent on
syntax on

let g:mapleader               = ' '
let g:jsx_ext_required        = 0
let g:gitgutter_map_keys      = 0
let g:ale_sign_warning        = '▸'
let g:ale_sign_error          = '▸'

set lazyredraw
set autoindent
set cursorline
set laststatus=2
set signcolumn=yes
set fillchars+=vert:│
set incsearch ignorecase
set splitright splitbelow
set backspace=indent,eol,start
set ruler number relativenumber
set list listchars=tab:▸\ ,trail:·
set wildmenu wildmode=list:longest
set tabstop=2 shiftwidth=2 noexpandtab
set nowrap novisualbell nobackup noswapfile
set foldenable foldmethod=syntax foldlevelstart=20

"
" Highlights
"

exe 'hi Pmenu ctermbg='                 . base16_cterm00
exe 'hi PmenuSel ctermbg='              . base16_cterm03 . ' ctermfg=' . base16_cterm05
exe 'hi TabLine ctermbg='               . base16_cterm00 . ' ctermfg=' . base16_cterm03
exe 'hi TabLineSel ctermbg='            . base16_cterm00 . ' ctermfg=' . base16_cterm05
exe 'hi TabLineFill ctermbg='           . base16_cterm00
exe 'hi LineNr ctermbg='                . base16_cterm00
exe 'hi CursorLine ctermbg='            . base16_cterm00
exe 'hi CursorLineNr ctermbg='          . base16_cterm00 . ' ctermfg=' . base16_cterm05
exe 'hi StatusLineText ctermfg='        . base16_cterm03
exe 'hi StatusLineNC ctermbg='          . base16_cterm03 . ' ctermfg=' . base16_cterm03
exe 'hi VertSplit ctermbg='             . base16_cterm00 . ' ctermfg=' . base16_cterm03
exe 'hi AleErrorSign ctermbg='          . base16_cterm00 . ' ctermfg=' . base16_cterm08
exe 'hi AleWarningSign ctermbg='        . base16_cterm00 . ' ctermfg=' . base16_cterm0D
exe 'hi GitGutterAdd ctermbg='          . base16_cterm00
exe 'hi GitGutterChange ctermbg='       . base16_cterm00
exe 'hi GitGutterDelete ctermbg='       . base16_cterm00
exe 'hi GitGutterChangeDelete ctermbg=' . base16_cterm00

"
" Statusline
"

set statusline =%#StatusLineText#
set statusline +=%{empty(fugitive#head(7))?'':fugitive#head(7).'\ '}%f%M
set statusline +=%=
set statusline +=%{&fileformat}
set statusline +=\ %{&fileencoding?&fileencoding:&encoding}
set statusline +=\ %l:%c
set statusline +=\ %p%%

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

noremap j gj
noremap k gk
nnoremap Y y$

nnoremap [oa :ALEDisable<cr>
nnoremap ]oa :ALEEnable<cr>

xmap ga <plug>(EasyAlign)
nmap ga <plug>(EasyAlign)

nnoremap <c-w>< <c-w>10<
nnoremap <c-w>- <c-w>10-
nnoremap <c-w>+ <c-w>10+
nnoremap <c-w>> <c-w>10>

nnoremap <leader>w :w<cr>
nnoremap <leader>W :wq<cr>
nnoremap <leader>q :q<cr>
nnoremap <leader>Q :q!<cr>
nnoremap <leader>gl :Glog<cr>
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>ga :Gwrite<cr>
nnoremap <leader>gd :Gdiff<cr>
nnoremap <leader>gb :Gblame<cr>
nnoremap <leader>gn <plug>GitGutterNextHunk
nnoremap <leader>gp <plug>GitGutterPrevHunk
