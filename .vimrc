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
Plug 'mxw/vim-jsx'
Plug 'tpope/vim-haml'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-markdown'

" Completion
Plug 'mattn/emmet-vim'
Plug 'sirver/ultisnips'
Plug 'honza/vim-snippets'
Plug 'raimondi/delimitmate'

" Code Display
Plug 'ervandew/supertab'
Plug 'flazz/vim-colorschemes'
Plug 'hail2u/vim-css3-syntax'
Plug 'pangloss/vim-javascript'

" Integrations
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'

" Interface
Plug 'kien/ctrlp.vim'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'altercation/vim-colors-solarized'

" Commands
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'

" Other
Plug 'craigemery/vim-autotag'
Plug 'godlygeek/tabular'

call plug#end()

"
" Settings
"

syntax enable
colorscheme solarized
filetype plugin indent on
set background=dark
set ruler
set number
set relativenumber
set cursorline
set showcmd
set showmatch
set wildmenu
set wildmode=list:longest
set wildignore=log/**/node_modules/**,tmp/**
set tags=./.tags,.tags;$HOME
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set smarttab
set smartindent
set autoindent
set indentkeys=o,O,<Return>,<>>,!^F
set backspace=eol,start,indent
set lazyredraw
set incsearch
set hlsearch
set listchars=tab:‣\ ,eol:¬
set foldenable
set foldlevelstart=10
set foldnestmax=10
set foldmethod=indent
set splitright
set splitbelow
set nowb
set nowrap
set nobackup
set nocompatible
set noerrorbells
set novisualbell
set noswapfile
set laststatus=2

let g:netrw_liststyle=3
let g:jsx_ext_required=0
let g:airline_powerline_fonts=1
let g:delimitMate_expand_cr=2
let g:delimitMate_expand_space=1
let g:UltiSnipsExpandTrigger='<tab>'
let g:UltiSnipsJumpForwardTrigger='<tab>'
let g:UltiSnipsJumpBackwardTrigger='<s-tab>'
let g:SuperTabDefaultCompletionType='context'
let g:ctrlp_custom_ignore='node_modules\|bower_components\|DS_Store\|git'
let g:ctrlp_match_window='bottom,order:ttb'
let g:ctrlp_working_path_mode=0
let g:ctrlp_switch_buffer=0

autocmd BufNewFile,BufRead *.css set syntax=scss

"
" Mappings
"

let mapleader=','

function! Ender(char)
  s/\v(.)$/\=submatch(1)==a:char ? '' : submatch(1).a:char
endfunction

nnoremap <leader>l :set list!<CR>
nnoremap <leader>h :set hlsearch!<CR>
vnoremap <leader>; :call Ender(';')<CR>
vnoremap <leader>, :call Ender(',')<CR>
nnoremap <leader>; m`:call Ender(';')<CR>``
nnoremap <leader>, m`:call Ender(',')<CR>``
inoremap <leader>; <Esc>m`:call Ender(';')<CR>``a
inoremap <leader>, <Esc>m`:call Ender(',')<CR>``a
