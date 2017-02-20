"
" Vim Config
"
" :: Plugins
" :: Settings
" :: Mappings

"
" Plugins
"

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/nerdtree'
Plugin 'bling/vim-airline'
Plugin 'kien/ctrlp.vim'
Plugin 'raimondi/delimitmate'
Plugin 'ervandew/supertab'
Plugin 'mattn/emmet-vim'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-markdown'
Plugin 'pangloss/vim-javascript'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'mxw/vim-jsx'

call vundle#end()
filetype plugin indent on

"
" Settings
"

syntax enable
set background=dark
set synmaxcol=512
colorscheme solarized

set ruler
set number
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

let g:jsx_ext_required=0
let g:markdown_fold_style = 'nested'
let g:SuperTabDefaultCompletionType='context'
let g:delimitMate_expand_cr=2
let g:delimitMate_expand_space=1
let g:ctrlp_match_window='bottom,order:ttb'
let g:ctrlp_switch_buffer=0
let g:ctrlp_working_path_mode=0
let g:ctrlp_open_new_file='h'
let g:ctrlp_open_multiple_files='h'
let g:ctrlp_custom_ignore='node_modules\|bower_components\|DS_Store\|git'
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#left_sep=''
let g:airline#extensions#tabline#left_alt_sep=''
let g:airline#extensions#tabline#right_sep=''
let g:airline#extensions#tabline#right_alt_sep=''

autocmd FileType * if &omnifunc != '' | call SuperTabChain(&omnifunc, '<C-p>') | endif
autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP
autocmd FileType php,html,haml setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType css,less,scss setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS

"
" Mappings
"

let mapleader=','

nnoremap <leader>l :set list!<CR>
nnoremap <leader>h :set hlsearch!<CR>
nnoremap <leader>; :s/\v(.)$/\=submatch(1)==';' ? '' : submatch(1).';'<CR>
nnoremap <leader>, :s/\v(.)$/\=submatch(1)==',' ? '' : submatch(1).','<CR>

nnoremap <C-n> :NERDTreeToggle<CR>
