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

" Language

Plug 'hail2u/vim-css3-syntax'
Plug 'tomtom/tcomment_vim'
Plug 'elzr/vim-json'
Plug 'mxw/vim-jsx'

" Completion

Plug 'shougo/neocomplete.vim'
Plug 'raimondi/delimitmate'
Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }
Plug 'mattn/emmet-vim'

" Code Display

Plug 'pangloss/vim-javascript'
Plug 'yggdroot/indentline'
Plug 'gregsexton/matchtag'
Plug 'ap/vim-css-color'

" Integrations

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-vinegar'
Plug 'janko-m/vim-test'
Plug 'w0rp/ale'

" Interface

Plug 'altercation/vim-colors-solarized'
Plug 'vim-airline/vim-airline-themes'
Plug 'bling/vim-airline'
Plug 'kien/ctrlp.vim'

" Commands

Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-repeat'

" Other

Plug 'craigemery/vim-autotag'
Plug 'tpope/vim-sensible'
Plug 'godlygeek/tabular'
Plug 'ujihisa/neco-look'

call plug#end()

"
" Settings
"

" Global

colorscheme solarized
set lazyredraw
set cursorline
set background=dark
set hlsearch ignorecase
set number relativenumber
set splitright splitbelow
set tags-=.tags tags-=.tags; tags^=.tags;
set nowb nowrap nobackup noswapfile nocompatible
set tabstop=2 softtabstop=2 shiftwidth=2 expandtab smarttab
au FileType markdown,text setlocal wrap linebreak nolist columns=120

let g:jsx_ext_required=0

let g:airline_powerline_fonts=1

let g:tern_show_signature_in_pum=1

let g:indentLine_char='┆'
let g:indentLine_color_term=240
let g:indentLine_color_gui='#586e75'

let g:autotagTagsFile='.tags'
let g:autotagCtagsCmd='ctags .'

let g:delimitMate_expand_cr=2
let g:delimitMate_expand_space=1
let g:delimitMate_jump_expansion=1

let g:user_emmet_next_key='<c-e>j'
let g:user_emmet_prev_key='<c-e>k'
let g:user_emmet_leader_key='<c-e>'
let g:user_emmet_settings={'javascript.jsx': {'extends': 'jsx'}}

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

call neocomplete#custom#source('look', 'min_pattern_length', 1)

"
" Mappings
"

let mapleader=' '

nmap <leader><leader> :
nmap <leader>[ <c-t>
nmap <leader>] <c-]>
nmap <leader>w <c-w>
nmap <leader>h <c-w>h
nmap <leader>j <c-w>j
nmap <leader>k <c-w>k
nmap <leader>l <c-w>l
nmap <leader>p <c-p>
nmap <leader>- :Rex<cr>
nmap <leader>s vi{:sort<cr>
nmap <leader>S m`:g#\({\n\)\@<=#.,/}/sort<cr>:let @/ = ""<cr>``
nmap <leader>i :set list!<cr>
nmap <leader>n :set hlsearch!<cr>
nmap <leader>a" m`:Tab /"<cr>``
vmap <leader>a" m`:Tab /"<cr>``
nmap <leader>a= m`:Tab /=<cr>``
vmap <leader>a= m`:Tab /=<cr>``
nmap <leader>a: m`:Tab /:\zs /l0<cr>``
vmap <leader>a: m`:Tab /:\zs /l0<cr>``

imap <c-e><cr> <cr><esc>O
nmap <c-e><cr> i<cr><esc>O

imap <expr> <tab> pumvisible() ? "\<c-n>" : "\<tab>"
imap <expr> <s-tab> pumvisible() ? "\<c-p>" : "\<tab>"
imap <expr> <cr> pumvisible() ? "\<c-y>" : '<plug>delimitMateCR'

function! Ender(char)
  s/\v(.)$/\=submatch(1)==a:char ? '' : submatch(1).a:char
endfunction

vmap ;; :call Ender(';')<cr>
vmap ,, :call Ender(',')<cr>
nmap ;; m`:call Ender(';')<cr>``
nmap ,, m`:call Ender(',')<cr>``
imap ;; <Esc>m`:call Ender(';')<cr>``a
imap ,, <Esc>m`:call Ender(',')<cr>``a
