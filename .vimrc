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

Plug 'sheerun/vim-polyglot'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-ragtag'

" Completion

Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }
Plug 'shougo/neocomplete.vim'
Plug 'raimondi/delimitmate'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-endwise'
Plug 'sirver/ultisnips'
Plug 'mattn/emmet-vim'

" Code Display

Plug 'gregsexton/matchtag'
Plug 'yggdroot/indentline'

" Integrations

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-eunuch'
Plug 'w0rp/ale'

" Interface

Plug 'altercation/vim-colors-solarized'
Plug 'vim-airline/vim-airline-themes'
Plug 'bling/vim-airline'
Plug 'kien/ctrlp.vim'

" Commands

Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'matchit.zip'

" Other

Plug 'craigemery/vim-autotag'
Plug 'godlygeek/tabular'
Plug 'ujihisa/neco-look'

call plug#end()

"
" Settings
"

syntax on
colorscheme solarized
filetype plugin indent on

set background=dark laststatus=2
set cursorline colorcolumn=120
set ruler number relativenumber
set backspace=eol,start,indent
set hlsearch ignorecase incsearch
set tags-=.tags tags-=.tags; tags^=.tags;
set nowb nowrap nobackup noswapfile nocompatible
set tabstop=2 softtabstop=2 shiftwidth=2 expandtab smarttab

au FileType css setlocal filetype=scss
au FileType markdown setlocal wrap linebreak nolist columns=120

let g:jsx_ext_required = 0
let g:airline_powerline_fonts = 1
let g:tern_show_signature_in_pum = 1

let g:autotagTagsFile = '.tags'
let g:autotagCtagsCmd = 'ctags .'

let g:indentLine_char='┆'
let g:indentLine_color_term=240
let g:indentLine_color_gui='#586e75'

let g:delimitMate_expand_cr = 2
let g:delimitMate_expand_space = 1
let g:delimitMate_jump_expansion = 1

let g:UltiSnipsExpandTrigger="<c-x>,"
let g:UltiSnipsJumpForwardTrigger="<c-x>j"
let g:UltiSnipsJumpBackwardTrigger="<c-x>k"

let g:user_emmet_next_key = '<c-e>j'
let g:user_emmet_prev_key = '<c-e>k'
let g:user_emmet_leader_key = '<c-e>'
let g:user_emmet_settings = {'javascript.jsx': {'extends': 'jsx'}}

let g:ctrlp_show_hidden = 1
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#enable_fuzzy_completion = 1
let g:neocomplete#auto_completion_start_length = 1
let g:neocomplete#enable_auto_close_preview = 1

call neocomplete#custom#source('look', 'min_pattern_length', 1)

"
" Mappings
"

let mapleader=' '

nmap <leader><leader> :
nmap <leader>w :w<cr>
nmap <leader>W :wq<cr>
nmap <leader>q :q<cr>
nmap <leader>Q :q!<cr>
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

nmap _ :Rex<cr>
imap <expr> <cr> pumvisible() ? "\<c-y>" : '<plug>delimitMateCR<plug>DiscretionaryEnd'
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
