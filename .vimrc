"
" Vim Config
"
" :: Plugins
" :: Settings
" :: Functions
" :: Mappings

"
" Plugins
"

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

" Language
Plugin 'pangloss/vim-javascript'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'tpope/vim-markdown'
Plugin 'mxw/vim-jsx'

" Completion
Plugin 'raimondi/delimitmate'
Plugin 'ervandew/supertab'
Plugin 'sirver/ultisnips'
Plugin 'mattn/emmet-vim'

" Interface
Plugin 'altercation/vim-colors-solarized'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/nerdtree'
Plugin 'bling/vim-airline'
Plugin 'kien/ctrlp.vim'

" Integration
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fugitive'

" Commands
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'

call vundle#end()
filetype plugin indent on

" Solarized

syntax enable
set background=dark
set synmaxcol=512
colorscheme solarized

" NERDTree

nnoremap <C-n> :NERDTreeToggle<CR>

" Airline

let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#left_sep=''
let g:airline#extensions#tabline#left_alt_sep=''
let g:airline#extensions#tabline#right_sep=''
let g:airline#extensions#tabline#right_alt_sep=''

" CtrlP

let g:ctrlp_match_window='bottom,order:ttb'
let g:ctrlp_switch_buffer=0
let g:ctrlp_working_path_mode=0
let g:ctrlp_open_new_file='h'
let g:ctrlp_open_multiple_files='h'
let g:ctrlp_custom_ignore='node_modules\|bower_components\|DS_Store\|git'

" Supertab

let g:SuperTabDefaultCompletionType='context'
autocmd FileType * if &omnifunc != '' | call SuperTabChain(&omnifunc, '<C-p>') | endif
autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP
autocmd FileType php,html,haml setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType css,less,scss setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS

if has("autocmd")
  filetype plugin indent on
endif

let g:markdown_fold_style = 'nested'

"
" Setings
"

set ruler
set number
set cursorline
set splitright
set splitbelow
set laststatus=2
set smarttab
set autoindent
set smartindent
set tabstop=4
set shiftwidth=4
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

"
" Functions
"

function! Expander()
	let line   = getline('.')
	let col    = col('.')
	let before = line[col-2]
	let after  = line[col-1]

	if before ==# '{' && after ==# '}' || before ==# 'p' && after ==# '?'
		return "\<CR>\<Esc>ko"
	elseif before ==# '(' && after ==# ')'
		return "\<CR>\<BS>\<Esc>ko"
	elseif before ==# '>' && after ==# '<' || before ==# '[' && after ==# ']' || before ==# '"' && after ==# '"' || before ==# "'" && after ==# "'"
		return "\<CR>\<Esc>ko\<Tab>"
	else
		return "\<CR>"
	endif
endfunction

function Ender(end)
	if getline('.') =~# a:end . '$'
		execute "normal \<End>x"
	else
		execute "normal \<End>a" . a:end
	endif

	normal `e
endfunction

"
" Mappings
"

let mapleader=','
nnoremap <leader>l :set list!<CR>
nnoremap <leader>h :set hlsearch!<CR>
inoremap <leader>; <Esc>me :call Ender(';')<CR>a
nnoremap <leader>; me :call Ender(';')<CR>
inoremap <leader>, <Esc>me :call Ender(',')<CR>a
nnoremap <leader>, me :call Ender(',')<CR>
inoremap <expr> <CR> Expander()
