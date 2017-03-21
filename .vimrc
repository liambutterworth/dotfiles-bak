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
Plug 'raimondi/delimitmate'
Plug 'honza/vim-snippets'
Plug 'sirver/ultisnips'
Plug 'mattn/emmet-vim'

" Code Display
Plug 'pangloss/vim-javascript'
Plug 'hail2u/vim-css3-syntax'
Plug 'ervandew/supertab'

" Integrations
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'

" Interface
Plug 'altercation/vim-colors-solarized'
Plug 'vim-airline/vim-airline-themes'
Plug 'bling/vim-airline'
Plug 'kien/ctrlp.vim'

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
set background=dark
set synmaxcol=512
colorscheme solarized
filetype plugin indent on

set ruler
set number
set relativenumber
set cursorline
set splitright
set splitbelow
set laststatus=2
set smarttab
set autoindent
set smartindent
set expandtab
set tabstop=2
set shiftwidth=2
set indentkeys=o,O,<Return>,<>>,!^F
set incsearch
set hlsearch
set smartcase
set ignorecase
set showcmd
set wildmenu
set wildmode=list:longest
set wildignore=log/**/node_modules/**,tmp/**
set tags=./.tags,.tags;$HOME
set nofoldenable
set foldmethod=indent
set foldlevel=0
set foldnestmax=1
set nowrap
set backspace=eol,start,indent
set listchars=tab:‣\ ,eol:¬
set nocompatible
set noerrorbells
set novisualbell
set lazyredraw
set noswapfile
set nobackup
set autoread
set nowb

let g:netrw_liststyle=3
let g:jsx_ext_required=0
let g:airline_powerline_fonts=1
let g:delimitMate_expand_cr=2
let g:delimitMate_expand_space=1
let g:ctrlp_custom_ignore='node_modules\|bower_components\|DS_Store\|git'
let g:SuperTabDefaultCompletionType='context'
let g:UltiSnipsExpandTrigger='<tab>'
let g:UltiSnipsJumpForwardTrigger='<tab>'
let g:UltiSnipsJumpBackwardTrigger='<s-tab>'

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
