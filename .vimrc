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

Plug 'kien/ctrlp.vim'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'altercation/vim-colors-solarized'
Plug 'ludovicchabant/vim-gutentags', { 'do': 'brew tap unversal-ctags/universal-ctags && brew install --HEAD universal-ctags' }
Plug 'valloric/youcompleteme', { 'do': './install.py --tern-completer' }
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-vinegar'
Plug 'reedes/vim-pencil'
Plug 'reedes/vim-lexical', { 'do': 'curl -fo ~/.vim/thesaurus/mthesaur.txt --create-dirs https://raw.githubusercontent.com/zeke/moby/master/words.txt' }
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'cakebaker/scss-syntax.vim'
Plug 'pangloss/vim-javascript'
Plug 'jiangmiao/auto-pairs'
Plug 'alvan/vim-closetag'
Plug 'gregsexton/MatchTag', { 'do': 'cp ftplugin/xml.vim ftplugin/javascript.vim' }
Plug 'mxw/vim-jsx'
Plug 'w0rp/ale', { 'do': 'pip install proselint' }

call plug#end()

"
" Settings
"

syntax on                 " enable syntax hilighting
colorscheme solarized     " use solarized theme
filetype plugin indent on " enable core plugins

set lazyredraw                                        " make vim more efficient
set nocompatible nowrap                               " things I don't like
set splitright splitbelow                             " split right and below by defualt
set backspace=eol,start,indent                        " backspace over everything
set ruler number relativenumber                       " line and column count; relative for motion
set hlsearch incsearch ignorecase                     " search settings
set list listchars=tab:▸\ ,trail:·                    " invisible characters
set wildmenu wildmode=list:longest                    " wildmenu completion settings
set tags-=.tags tags-=.tags; tags^=.tags;             " hidden tag file
set background=dark laststatus=2 cursorline           " interface settings
set tabstop=2 softtabstop=2 shiftwidth=2 expandtab    " tab settings
set foldenable foldmethod=syntax foldlevelstart=20    " sane fold settings
set backupdir=~/.vim/backup// directory=~/.vim/swap// " dont clutter the working directory

autocmd FileType html setlocal omnifunc=htmlcomplete#CompleteTags            " enable html auto completion
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSs filetype=scss " enable css auto completion
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS  " enable javascript auto completion
autocmd FileType markdown call pencil#init() | call lexical#init()           " initialize prose plugins

highlight SignColumn ctermbg=8/4 guibg=#002b36
highlight NonText ctermfg=8/4 guifg=#073642

let g:ctrlp_show_hidden=1                             " show hidden files in ctrlp
let g:ctrlp_match_window='bottom,order:ttb'           " search window on bottom sorted from top to bottom
let g:ctrlp_custom_ignore='node_modules\|git'         " ignore these directories in ctrlp
let g:ycm_collect_identifiers_from_tags_files=1       " autocomplete from tags
let g:ycm_autoclose_preview_window_after_completion=1 " close preview with popup menu
let g:closetag_filenames='*.html,*.js,*.jsx'          " enable tag completion in these files
let g:ale_statusline_format=['⨉ %d', '⚠ %d', '⬥ ok']  " ale error message format
let g:ale_sign_error='▸'                              " better error sign
let g:ale_sign_warning='▸'                            " better warning sign
let g:airline_powerline_fonts=1                       " use the powerline fonts
let g:airline_section_error='%{ALEGetStatusLine()}'   " show ale error message in airline
let g:airline_section_x='%{PencilMode()}'             " show pencil mode in airline
let g:pencil#textwidth=120                            " default text width in markdown
let g:gutentags_ctags_tagfile='.tags'                 " auto compile .tags
let g:jsx_ext_required=0                              " don't require the jsx extension

"
" Mappings
"

let mapleader=' '

" motion

noremap j gj
noremap k gk
noremap _ :e#<cr>
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" sort alphabetically between {}

nnoremap <leader>s vi{:sort<cr>
nnoremap <leader>S m`:g#\({\n\)\@<=#.,/}/sort<cr>:let @/ = ""<cr>``

" tabular align

nnoremap <leader>a" m`:Tab /"<cr>``
vnoremap <leader>a" m`:Tab /"<cr>``
nnoremap <leader>a= m`:Tab /=<cr>``
vnoremap <leader>a= m`:Tab /=<cr>``
nnoremap <leader>a: m`:Tab /:\zs /l0<cr>``
vnoremap <leader>a: m`:Tab /:\zs /l0<cr>``

" append characters

function! Ender(char)
  s/\v(.)$/\=submatch(1)==a:char ? '' : submatch(1).a:char
endfunction

vnoremap ;; :call Ender(';')<cr>
vnoremap ,, :call Ender(',')<cr>
nnoremap ;; m`:call Ender(';')<cr>``
nnoremap ,, m`:call Ender(',')<cr>``
inoremap ;; <Esc>m`:call Ender(';')<cr>``a
inoremap ,, <Esc>m`:call Ender(',')<cr>``a
