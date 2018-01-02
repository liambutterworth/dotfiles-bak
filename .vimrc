"
" Vim Config
"
" :: Plugins
" :: Settings
" :: Mappings

"
" Plugins
"

call plug#begin()

Plug 'w0rp/ale'
Plug 'morhetz/gruvbox'
Plug 'cakebaker/scss-syntax.vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'edkolev/tmuxline.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'jiangmiao/auto-pairs'
Plug 'alvan/vim-closetag'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'

call plug#end()

"
" Settings
"
" :: General
" :: Plugins
" :: Highlight
" :: Commands

" General

silent! colorscheme gruvbox
filetype plugin indent on
runtime macros/matchit.vim
scriptencoding utf-8

set encoding=utf-8
set autoindent
set cursorline
set laststatus=2
set tags=./.tags;
set signcolumn=yes
set nowrap novisualbell
set splitright splitbelow
set backspace=indent,eol,start
set ruler number relativenumber
set hlsearch incsearch ignorecase
set list listchars=tab:▸\ ,trail:·
set wildmenu wildmode=list:longest
set tabstop=2 shiftwidth=2 noexpandtab
set foldenable foldmethod=syntax foldlevelstart=20
set backupdir=~/.vim/backup// directory=~/.vim/swap//

" Plugins

let g:jsx_ext_required        = 0
let g:javascript_plugin_jsdoc = 1
let g:closetag_filenames      = '*.html,*.php,*.js,*.jsx'
let g:gitgutter_map_keys      = 0
let g:airline_powerline_fonts = 1
let g:airline_section_error   = '%{ALEGetStatusLine()}'
let g:ale_statusline_format   = [ '⨉ %d', '⚠ %d', '⬥ ok' ]
let g:ale_sign_warning        = '▸'
let g:ale_sign_error          = '▸'

let g:ale_linters = {
  \ 'javascript': [ 'eslint' ],
  \ 'css':        [ 'stylelint' ],
  \ 'html':       [ 'htmlhint' ]
  \ }

let g:tmuxline_preset = {
  \ 'b':       '#(whoami)@#H',
  \ 'c':       '#S',
  \ 'win':     '#W',
  \ 'cwin':    '#W',
  \ 'y':       '%a %b %d %R %p',
  \ 'options': { 'status-justify': 'left' }
  \ }

" Highlight

highlight search ctermbg=0 ctermfg=3 guibg=#282828 guifg=#d79921
highlight incsearch ctermbg=0 ctermfg=3 guibg=#282828 guifg=#d79921
highlight aleerrorsign ctermbg=237 ctermfg=167
highlight alewarningsign ctermbg=237 ctermfg=109
highlight nontext ctermfg=0 guifg=#282828

" Commands

autocmd filetype * set formatoptions-=o
autocmd filetype scss.css setlocal commentstring=/*%s*/
autocmd bufread,bufnewfile *.css set filetype=scss.css
autocmd CompleteDone * pclose

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
" :: General
" :: Leader
" :: FZF
" :: Git
" :: Toggle
" :: Ender

" General

noremap j gj
noremap k gk

nnoremap Y y$

nnoremap <bs> :e#<cr>

nnoremap <c-w>h <c-w>12<
nnoremap <c-w>j <c-w>8-
nnoremap <c-w>k <c-w>8+
nnoremap <c-w>l <c-w>12>

xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" Leader

let mapleader = ' '

nnoremap <leader>o m`o<esc>``
nnoremap <leader>O m`O<esc>``

nnoremap <leader>w :w<cr>
nnoremap <leader>W :wq<cr>
nnoremap <leader>q :q<cr>
nnoremap <leader>Q :q!<cr>

" FZF

nnoremap <leader><leader> :Files<cr>

imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

" Git

nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gl :Glog<cr>
nnoremap <leader>ga :Gwrite<cr>
nnoremap <leader>gd :Gdiff<cr>
nnoremap <leader>gb :Gblame<cr>
nnoremap <leader>gn <plug>GitGutterNextHunk
nnoremap <leader>gp <plug>GitGutterPrevHunk

" Toggle

nnoremap [h :set nohlsearch<cr>
nnoremap ]h :set hlsearch<cr>
nnoremap [l :set nolist<cr>
nnoremap ]l :set list<cr>
nnoremap [a :ALEDisable<cr>
nnoremap ]a :ALEEnable<cr>

" Ender

function! Ender(char)
  s/\v(.)$/\=submatch(1)==a:char ? '' : submatch(1).a:char
endfunction

vnoremap ,, :call Ender(',')<cr>
nnoremap ,, m`:call Ender(',')<cr>``
inoremap ,, <esc>m`:call Ender(',')<cr>``a

vnoremap ;; :call Ender(';')<cr>
nnoremap ;; m`:call Ender(';')<cr>``
inoremap ;; <esc>m`:call Ender(';')<cr>``a
