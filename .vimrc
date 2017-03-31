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
Plug 'valloric/youcompleteme'
Plug 'ludovicchabant/vim-gutentags'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-eunuch'
Plug 'godlygeek/tabular'
Plug 'reedes/vim-pencil'
Plug 'reedes/vim-lexical'
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

autocmd FileType markdown call pencil#init()
autocmd FileType markdown call lexical#init()
autocmd FileType html setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSs filetype=scss
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS

let g:ctrlp_show_hidden=1
let g:ctrlp_match_window='bottom,order:ttb'
let g:ctrlp_custom_ignore='node_modules\|git'
let g:ycm_collect_identifiers_from_tags_files=1
let g:ycm_autoclose_preview_window_after_completion=1
let g:closetag_filenames='*.html,*.js,*.jsx'
let g:gutentags_ctags_tagfile='.tags'
let g:vim_markdown_folding_disabled=1
let g:airline_powerline_fonts=1
let g:jsx_ext_required=0
let g:AutoPairsFlyMode=1

"
" Mappings
"

let mapleader=' '

nnoremap <leader>s vi{:sort<cr>
nnoremap <leader>S m`:g#\({\n\)\@<=#.,/}/sort<cr>:let @/ = ""<cr>``
nnoremap <leader>a" m`:Tab /"<cr>``
vnoremap <leader>a" m`:Tab /"<cr>``
nnoremap <leader>a= m`:Tab /=<cr>``
vnoremap <leader>a= m`:Tab /=<cr>``
nnoremap <leader>a: m`:Tab /:\zs /l0<cr>``
vnoremap <leader>a: m`:Tab /:\zs /l0<cr>``

noremap j gj
noremap k gk
noremap _ :Rex<cr>
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

function! Ender(char)
  s/\v(.)$/\=submatch(1)==a:char ? '' : submatch(1).a:char
endfunction

vnoremap ;; :call Ender(';')<cr>
vnoremap ,, :call Ender(',')<cr>
nnoremap ;; m`:call Ender(';')<cr>``
nnoremap ,, m`:call Ender(',')<cr>``
inoremap ;; <Esc>m`:call Ender(';')<cr>``a
inoremap ,, <Esc>m`:call Ender(',')<cr>``a
