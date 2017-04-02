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
Plug 'edkolev/tmuxline.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'vim-airline/vim-airline-themes'
Plug 'altercation/vim-colors-solarized'
Plug 'ludovicchabant/vim-gutentags', { 'do': 'brew tap unversal-ctags/universal-ctags && brew install --HEAD universal-ctags' }
Plug 'valloric/youcompleteme', { 'do': './install.py --tern-completer' }
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-dispatch'
Plug 'reedes/vim-pencil'
Plug 'reedes/vim-lexical', { 'do': 'curl -fo ~/.vim/thesaurus/mthesaur.txt --create-dirs https://raw.githubusercontent.com/zeke/moby/master/words.txt' }
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'cakebaker/scss-syntax.vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'jiangmiao/auto-pairs'
Plug 'alvan/vim-closetag'
Plug 'gregsexton/MatchTag', { 'do': 'cd ftplugin && cp xml.vim javascript.vim' }
Plug 'matchit.zip'
Plug 'w0rp/ale'

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

let g:ctrlp_show_hidden=1                             " show hidden files in ctrlp
let g:ctrlp_match_window='bottom,order:ttb'           " search window on bottom sorted from top to bottom
let g:ctrlp_custom_ignore='node_modules\|git'         " ignore these directories in ctrlp
let g:ycm_collect_identifiers_from_tags_files=1       " autocomplete from tags
let g:ycm_autoclose_preview_window_after_completion=1 " close preview with popup menu
let g:closetag_filenames='*.html,*.js,*.jsx'          " enable tag completion in these files
let g:ale_statusline_format=['⨉ %d', '⚠ %d', '⬥ ok']  " ale status line format
let g:ale_sign_error='▸'                              " better error sign
let g:ale_sign_warning='▸'                            " better warning sign
let g:airline_powerline_fonts=1                       " use the powerline fonts
let g:airline_section_error='%{ALEGetStatusLine()}'   " show ale error message in airline
let g:airline_section_x='%{PencilMode()}'             " show pencil mode in airline
let g:pencil#textwidth=120                            " default text width in markdown
let g:lexical#spell_key='<leader>ls'                  " spell shortcut
let g:lexical#thesaurus_key='<leader>lt'              " thesaurus shortcut
let g:lexical#dictionary_key='<leader>lk'             " dictionary shortcut
let g:gutentags_ctags_tagfile='.tags'                 " auto compile .tags
let g:jsx_ext_required=0                              " don't require the jsx extension

highlight SignColumn ctermbg=8/4 guibg=#002b36
highlight NonText ctermfg=8/4 guifg=#073642

autocmd FileType html setlocal omnifunc=htmlcomplete#CompleteTags            " enable html auto completion
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSs filetype=scss " enable css auto completion
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS  " enable javascript auto completion
autocmd FileType markdown call pencil#init() | call lexical#init()           " initialize prose plugins
autocmd FileType markdown let g:AutoPairsMapCR=0                             " disable <cr> expansion in markdown files

"
" Mappings
"

let mapleader=' '

noremap j gj
noremap k gk
inoremap jj <esc>

" append character

function! Ender(char)
  s/\v(.)$/\=submatch(1)==a:char ? '' : submatch(1).a:char
endfunction

vnoremap ;; :call Ender(';')<cr>
vnoremap ,, :call Ender(',')<cr>
nnoremap ;; m`:call Ender(';')<cr>``
nnoremap ,, m`:call Ender(',')<cr>``
inoremap ;; <Esc>m`:call Ender(';')<cr>``a
inoremap ,, <Esc>m`:call Ender(',')<cr>``a

nnoremap <silent> <c-a>h :TmuxNavigateLeft<cr>
nnoremap <silent> <c-a>j :TmuxNavigateDown<cr>
nnoremap <silent> <c-a>k :TmuxNavigateUp<cr>
nnoremap <silent> <c-a>l :TmuxNavigateRight<cr>
nnoremap <silent> <c-a>\ :TmuxNavigatePrevious<cr>

" file commands

nnoremap <leader>fw :w<cr>
nnoremap <leader>fW :wq<cr>
nnoremap <leader>fq :q<cr>
nnoremap <leader>fQ :q!<cr>

" git commands

nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gl :Glog<cr>
nnoremap <leader>ga :Gwrite<cr>
nnoremap <leader>gd :Gdiff<cr>
nnoremap <leader>gb :Gblame<cr>

" align commands

nnoremap <leader>a" m`:Tab /"<cr>``
vnoremap <leader>a" m`:Tab /"<cr>``
nnoremap <leader>a= m`:Tab /=<cr>``
vnoremap <leader>a= m`:Tab /=<cr>``
nnoremap <leader>a: m`:Tab /:\zs /l0<cr>``
vnoremap <leader>a: m`:Tab /:\zs /l0<cr>``

" Sort commands

nnoremap <leader>s{ vi{:sort<cr>
nnoremap <leader>s} m`:g#\({\n\)\@<=#.,/}/sort<cr>:let @/ = ""<cr>``
