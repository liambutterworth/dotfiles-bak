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

" Completion

Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }
Plug 'shougo/neocomplete.vim'
Plug 'raimondi/delimitmate'
Plug 'tpope/vim-endwise'
Plug 'mattn/emmet-vim'
Plug 'sirver/ultisnips'
Plug 'honza/vim-snippets'

" Code Display

Plug 'gregsexton/matchtag'
Plug 'yggdroot/indentline'
Plug 'ap/vim-css-color'

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

set ruler number relativenumber
set backspace=eol,start,indent
set hlsearch ignorecase incsearch
set tags-=.tags tags-=.tags; tags^=.tags;
set background=dark laststatus=2 cursorline
set nowb nowrap nobackup noswapfile nocompatible
set tabstop=2 softtabstop=2 shiftwidth=2 expandtab smarttab

au FileType css setlocal filetype=scss
au FileType markdown setlocal wrap linebreak nolist columns=120
au FileType css setlocal omnifunc=csscomplete#CompleteCSS
au FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
au FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
au FileType python setlocal omnifunc=pythoncomplete#Complete
au FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

let g:jsx_ext_required = 0
let g:airline_powerline_fonts = 1
let g:tern_show_signature_in_pum = 1

let g:autotagTagsFile = '.tags'
let g:autotagCtagsCmd = 'ctags .'

let g:indentLine_char='┆'
let g:indentLine_color_term = 240
let g:indentLine_color_gui = '#586e75'

let g:user_emmet_leader_key = '<c-e>'

let g:UltiSnipsExpandTrigger='<c-x>,'
let g:UltiSnipsJumpForwardTrigger='<c-x>n'
let g:UltiSnipsJumpBackwardTrigger='<c-x>N'

let g:delimitMate_expand_cr = 2
let g:delimitMate_expand_space = 1
let g:delimitMate_jump_expansion = 1

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

nmap <leader>i :set list!<cr>
nmap <leader>n :set hlsearch!<cr>
nmap <leader>s vi{:sort<cr>
nmap <leader>S m`:g#\({\n\)\@<=#.,/}/sort<cr>:let @/ = ""<cr>``
nmap <leader>a" m`:Tab /"<cr>``
vmap <leader>a" m`:Tab /"<cr>``
nmap <leader>a= m`:Tab /=<cr>``
vmap <leader>a= m`:Tab /=<cr>``
nmap <leader>a: m`:Tab /:\zs /l0<cr>``
vmap <leader>a: m`:Tab /:\zs /l0<cr>``

nmap _ :Rex<cr>
imap <c-e><cr> <cr><esc>O
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
