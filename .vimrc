"
" Vim Config
"
" :: Plugins
" :: Settings
" :: Maps

"
" Plugins
"

call plug#begin()

Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'reedes/vim-pencil'
Plug 'reedes/vim-lexical', { 'do': 'curl -fo ~/.vim/thesaurus/mthesaur.txt --create-dirs https://raw.githubusercontent.com/zeke/moby/master/words.txt' }
Plug 'cakebaker/scss-syntax.vim'
Plug 'tomtom/tcomment_vim'
Plug 'mxw/vim-jsx'
Plug 'ludovicchabant/vim-gutentags'
Plug 'valloric/youcompleteme', { 'do': './install.py --tern-completer' }
Plug 'jiangmiao/auto-pairs'
Plug 'alvan/vim-closetag'
Plug 'pangloss/vim-javascript'
Plug 'gregsexton/MatchTag', { 'do': 'cd ftplugin && cp xml.vim javascript.vim' }
Plug 'yggdroot/indentline'
Plug 'w0rp/ale'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-eunuch'
Plug 'kien/ctrlp.vim'
Plug 'whatyouhide/vim-gotham'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'christoomey/vim-tmux-navigator'
Plug 'edkolev/tmuxline.vim'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'matchit.zip'

call plug#end()

"
" Settings
"

filetype plugin indent on                                                    " init core vim plugins
colorscheme gotham                                                           " define colorscheme
syntax on                                                                    " turn on syntax highlighting

set lazyredraw                                                               " make vim more efficient
set nocompatible nowrap                                                      " things I don't like
set splitright splitbelow                                                    " split right and below by defualt
set backspace=eol,start,indent                                               " backspace over everything
set ruler number relativenumber                                              " line and column count; relative for motion
set hlsearch incsearch ignorecase                                            " search settings
set list listchars=tab:▸\ ,trail:·                                           " invisible characters
set wildmenu wildmode=list:longest                                           " wildmenu completion settings
set tags-=.tags tags-=.tags; tags^=.tags;                                    " hidden tag file
set background=dark laststatus=2 cursorline                                  " interface settings
set tabstop=2 softtabstop=2 shiftwidth=2 expandtab                           " tab settings
set foldenable foldmethod=syntax foldlevelstart=20                           " sane fold settings
set backupdir=~/.vim/backup// directory=~/.vim/swap//                        " dont clutter the working directory

autocmd FileType html setlocal omnifunc=htmlcomplete#CompleteTags            " enable html auto completion
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSs filetype=scss " enable css auto completion
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS  " enable javascript auto completion

autocmd FileType markdown call pencil#init()
autocmd FileType markdown call lexical#init()
autocmd FileType markdown let g:AutoPairsMapCR = 0

highlight Search ctermbg=3 ctermfg=0 guibg=#eee8d5 guifg=#cb4b16
highlight IncSearch ctermbg=3 ctermfg=0 guibg=#eee8d5 guifg=#cb4b16
highlight NonText ctermfg=0 guifg=#073642

let g:pencil#textwidth                              = 120
let g:lexical#spell_key                             = '<leader>ls'
let g:lexical#thesaurus_key                         = '<leader>lt'
let g:lexical#dictionary_key                        = '<leader>lk'
let g:vim_markdown_conceal                          = 0
let g:jsx_ext_required                              = 0
let g:gutentags_ctags_tagfile                       = '.tags'
let g:ycm_collect_identifiers_from_tags_files       = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:indentLine_color_term                         = 12
let g:indentLine_color_gui                          = '#0a3749'
let g:indentLine_char                               = '│'
let g:ale_statusline_format                         = [ '⨉ %d', '⚠ %d', '⬥ ok' ]
let g:ale_sign_warning                              = '▸'
let g:ale_sign_error                                = '▸'
let g:closetag_filenames                            = '*.html,*.js,*.jsx'
let g:ctrlp_show_hidden                             = 1
let g:ctrlp_match_window                            = 'bottom,order:ttb'
let g:ctrlp_custom_ignore                           = 'node_modules\|git'
let g:airline_powerline_fonts                       = 1
let g:airline_section_error                         = '%{ALEGetStatusLine()}'
let g:airline_section_x                             = '%{PencilMode()}'

let g:tmuxline_preset = {
  \ 'b':       '#(whoami)@#H',
  \ 'c':       '#S',
  \ 'win':     '#W',
  \ 'cwin':    '#W',
  \ 'x':       '#(tmux-spotify-info)',
  \ 'y':       '%a %b %d %R %p',
  \ 'options': { 'status-justify': 'left' }
  \ }



"
" Maps
"

let mapleader=' '

" navigation

noremap j gj
noremap k gk

noremap <up> <nop>
noremap <left> <nop>
noremap <down> <nop>
noremap <right> <nop>

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

" sort commands

nnoremap <leader>s{ vi{:sort<cr>
nnoremap <leader>s} m`:g#\({\n\)\@<=#.,/}/sort<cr>:let @/ = ""<cr>``

" append commands

function! Ender(char)
  s/\v(.)$/\=submatch(1)==a:char ? '' : submatch(1).a:char
endfunction

vnoremap ;; :call Ender(';')<cr>
vnoremap ,, :call Ender(',')<cr>
nnoremap ;; m`:call Ender(';')<cr>``
nnoremap ,, m`:call Ender(',')<cr>``
inoremap ;; <Esc>m`:call Ender(';')<cr>``a
inoremap ,, <Esc>m`:call Ender(',')<cr>``a
