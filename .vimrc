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

Plug 'altercation/vim-colors-solarized'
Plug 'vim-airline/vim-airline-themes'
Plug 'bling/vim-airline'
Plug 'kien/ctrlp.vim'
Plug 'shougo/neocomplete.vim'
Plug 'craigemery/vim-autotag'
Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }
Plug 'ujihisa/neco-look'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-eunuch'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'cakebaker/scss-syntax.vim'
Plug 'pangloss/vim-javascript'
Plug 'jiangmiao/auto-pairs'
Plug 'alvan/vim-closetag'
Plug 'mxw/vim-jsx'
Plug 'w0rp/ale'

call plug#end()

"
" Settings
"

syntax on
colorscheme solarized
filetype plugin indent on

set lazyredraw
set splitright splitbelow
set list listchars=trail:·
set backspace=eol,start,indent
set ruler number relativenumber
set hlsearch incsearch ignorecase
set tags-=.tags tags-=.tags; tags^=.tags;
set background=dark laststatus=2 cursorline
set nowb nowrap nobackup noswapfile nocompatible
set tabstop=2 softtabstop=2 shiftwidth=2 expandtab

autocmd FileType css setlocal filetype=scss
autocmd FileType markdown setlocal spell wrap linebreak nolist

let g:airline_powerline_fonts=1
let g:ctrlp_show_hidden=1
let g:ctrlp_switch_buffer=0
let g:ctrlp_working_path_mode=0
let g:ctrlp_match_window='bottom,order:ttb'
let g:ctrlp_custom_ignore='node_modules\|DS_Store\|git'
let g:neocomplete#enable_at_startup=1
let g:neocomplete#enable_smart_case=1
let g:neocomplete#enable_fuzzy_completion=1
let g:neocomplete#auto_completion_start_length=1
let g:neocomplete#enable_auto_close_preview=1
let g:tern_show_signature_in_pum=1
let g:autotagTagsFile='.tags'
let g:autotagCtagsCmd='ctags .'
let g:closetag_filenames='*.html,*.js,*.jsx'
let g:AutoPairsFlyMode=1
let g:jsx_ext_required=0

call neocomplete#custom#source('look', 'min_pattern_length', 1)

"
" Mappings
"

let mapleader=' '

nmap <leader>s vi{:sort<cr>
nmap <leader>S m`:g#\({\n\)\@<=#.,/}/sort<cr>:let @/ = ""<cr>``
nmap <leader>a" m`:Tab /"<cr>``
vmap <leader>a" m`:Tab /"<cr>``
nmap <leader>a= m`:Tab /=<cr>``
vmap <leader>a= m`:Tab /=<cr>``
nmap <leader>a: m`:Tab /:\zs /l0<cr>``
vmap <leader>a: m`:Tab /:\zs /l0<cr>``

nmap j gj
nmap k gk
nmap _ :Rex<cr>
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

imap <expr> <cr> pumvisible() ? "\<c-y>" : "\<cr>"
imap <expr> <tab> pumvisible() ? "\<c-n>" : "\<tab>"
imap <expr> <s-tab> pumvisible() ? "\<c-p>" : "\<tab>"

function! Ender(char)
  s/\v(.)$/\=submatch(1)==a:char ? '' : submatch(1).a:char
endfunction

vmap ;; :call Ender(';')<cr>
vmap ,, :call Ender(',')<cr>
nmap ;; m`:call Ender(';')<cr>``
nmap ,, m`:call Ender(',')<cr>``
imap ;; <Esc>m`:call Ender(';')<cr>``a
imap ,, <Esc>m`:call Ender(',')<cr>``a
