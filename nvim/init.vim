"
" Vim
"
" :: Settings
" :: Mappings
" :: Plugins

"
" Settings
"

filetype plugin indent on
syntax enable

set autoindent
set backspace=indent,eol,start
set complete=.,w,b,u,t,k
set dictionary=/usr/share/dict/words
set directory=~/.cache/nvim/swap//
set encoding=utf-8
set expandtab shiftwidth=4 softtabstop=4
set fillchars+=vert:\ 
set foldenable foldmethod=indent foldlevelstart=99
set hidden
set incsearch
set ignorecase smartcase
set laststatus=0
set lazyredraw
set list listchars=tab:│\ ,trail:·
set nobackup nowritebackup
set nohlsearch
set nojoinspaces
set nowrap
set number relativenumber
set signcolumn=yes
set shortmess+=c
set spelllang=en_us
set splitbelow splitright
set undofile undodir=~/.cache/nvim/undo//
set updatetime=300
set wildmenu wildignorecase wildmode=list:longest,list:full

let g:mapleader = "\<space>"
let g:netrw_altfile = 1
let g:netrw_dirhistmax = 0
let g:netrw_fastbrowse = 0
let g:python3_host_prog = command#execute('which python3')
let g:vim_indent_cont = &shiftwidth
let &helpheight = &lines / 2
let &previewheight = &lines / 2

augroup settings
    autocmd!
    autocmd FileType * setlocal formatoptions-=o
augroup end

"
" Mappings
"

nmap j gj
nmap k gk
nmap Y y$
nmap Q @q
nmap <bs> <c-^>
nnoremap c* *``cgn
nnoremap c# #``cgN
nnoremap d* *``dgn
nnoremap d# #``dgN
nnoremap g= mmgg=G`m

nnoremap <silent> <leader>q :bdelete<cr>
nnoremap <silent> <leader>t :tabedit<cr>
nnoremap <silent> <leader>s :split<cr>
nnoremap <silent> <leader>v :vsplit<cr>
nnoremap <silent> <leader>p :tabprevious<cr>
nnoremap <silent> <leader>n :tabnext<cr>
nnoremap <silent> <leader>P :-tabmove<cr>
nnoremap <silent> <leader>N :+tabmove<cr>
nnoremap <silent> <leader>h 5<c-w><
nnoremap <silent> <leader>j 5<c-w>-
nnoremap <silent> <leader>k 5<c-w>+
nnoremap <silent> <leader>l 5<c-w>>

nnoremap <silent> [ow :set nowrap<cr>
nnoremap <silent> ]ow :set wrap<cr>
nnoremap <silent> [os :set nospell<cr>
nnoremap <silent> ]os :set spell<cr>
nnoremap <silent> [oh :set nohlsearch<cr>
nnoremap <silent> [oh :set hlsearch<cr>
nnoremap <silent> [<bs> :bprevious<cr>
nnoremap <silent> ]<bs> :bnext<cr>
nnoremap <silent> [<space> O<esc>j
nnoremap <silent> ]<space> o<esc>'[k
nnoremap <silent> ]e :<c-u>call line#move('n', 'down', v:count)<cr>
nnoremap <silent> [e :<c-u>call line#move('n', 'up', v:count)<cr>
vnoremap <silent> ]e :<c-u>call line#move('v', 'down', v:count)<cr>
vnoremap <silent> [e :<c-u>call line#move('v', 'up', v:count)<cr>
vnoremap <silent> <c-x>; :call line#ender(';')<cr>
vnoremap <silent> <c-x>, :call line#ender(',')<cr>
inoremap <silent> <c-x>; <esc>mm:call line#ender(';')<cr>`ma
inoremap <silent> <c-x>, <esc>mm:call line#ender(',')<cr>`ma

"
" Plugins
"

call plug#begin()

Plug 'airblade/vim-gitgutter'
Plug 'arcticicestudio/nord-vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'cohama/lexima.vim'
Plug 'junegunn/fzf', { 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'michaeljsmith/vim-indent-object'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'sheerun/vim-polyglot'
Plug 'suy/vim-context-commentstring'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'

call plug#end()

if plugin#exists('coc.nvim')
    let g:coc_global_extensions = [
        \ 'coc-css',
        \ 'coc-html',
        \ 'coc-json',
        \ 'coc-phpls',
        \ 'coc-tsserver',
        \ 'coc-vimlsp',
        \ 'coc-vetur',
        \ ]

    nmap <silent> gd <plug>(coc-definition)
    nmap <silent> gy <plug>(coc-type-definition)
    nmap <silent> gi <plug>(coc-implementation)
    nmap <silent> gr <plug>(coc-references)
    nmap <silent> ]g <plug>(coc-diagnostic-next)
    nmap <silent> [g <plug>(coc-diagnostic-prev)

    nnoremap <silent><expr> K index(['vim', 'help'], &filetype) >= 0
        \ ? ":execute 'help ' . expand('<cword>')<cr>"
        \ : ":call CocAction('doHover')<cr>"

    nnoremap <expr> <c-e> coc#util#has_float() ? coc#util#float_scroll(1) : "\<c-e>"
    nnoremap <expr> <c-y> coc#util#has_float() ? coc#util#float_scroll(0) : "\<c-y>"
    nnoremap <expr> <c-d> coc#util#has_float() ? coc#util#float_scroll(1) : "\<c-d>"
    nnoremap <expr> <c-u> coc#util#has_float() ? coc#util#float_scroll(0) : "\<c-u>"
    nnoremap <expr> <c-f> coc#util#has_float() ? coc#util#float_scroll(1) : "\<c-f>"
    nnoremap <expr> <c-b> coc#util#has_float() ? coc#util#float_scroll(0) : "\<c-b>"
endif

if plugin#exists('fzf') && command#exists('fzf')
    let s:git_commit_format = '--format="%C(red)%C(bold)%h%d%C(reset) %s %C(blue)%cr"'
    let g:fzf_commits_log_options = '--graph --color=always ' . s:git_commit_format
    let g:fzf_prefer_tmux = exists('$TMUX')

    let g:fzf_action = {
        \ 'ctrl-t': 'tab split',
        \ 'ctrl-s': 'split',
        \ 'ctrl-v': 'vsplit',
        \ }

    command! -bang -nargs=? -complete=dir Files
        \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

    imap <c-x><c-k> <plug>(fzf-complete-word)
    imap <c-x><c-j> <plug>(fzf-complete-file)
    imap <c-x><c-p> <plug>(fzf-complete-path)
    imap <c-x><c-l> <plug>(fzf-complete-line)

    nnoremap <leader><space> :Files<cr>
    nnoremap <leader><bs> :Buffers<cr>
    nnoremap <leader><cr> :Commits<cr>
    nnoremap <leader>/ :History/<cr>
    nnoremap <leader>: :History:<cr>
    nnoremap <leader>? :Helptags<cr>
    nnoremap <leader>` :Marks<cr>
endif

if plugin#exists('nord-vim')
    let g:nord_bold_vertical_split_line = 1
    let g:nord_italic = 1
    let g:nord_italic_comments = 1
    let g:nord_underline = 1

    colorscheme nord

    highlight StatusLine ctermfg=0 ctermbg=0
    highlight StatusLineNC ctermfg=0 ctermbg=0
endif

if plugin#exists('vim-context-commentstring')
    let g:context#commentstring#table = {}

    let g:context#commentstring#table['html'] = {
        \ 'javaScript'  : '// %s',
        \ 'cssStyle'    : '/* %s */',
        \ }

    let g:context#commentstring#table['javascript.jsx'] = {
        \ 'jsComment' : '// %s',
        \ 'jsImport' : '// %s',
        \ }

    let g:context#commentstring#table['vue'] = {
        \ 'javaScript'  : '// %s',
        \ 'cssStyle'    : '/* %s */',
        \ }

    let g:context#commentstring#table['php'] = {
        \ 'phpRegion' : '// %s',
        \ 'phpIdentifier' : '// %s',
        \ 'phpVarSelector' : '// %s',
        \ }
endif

if plugin#exists('vim-easy-align')
    xmap ga <plug>(EasyAlign)
    nmap ga <plug>(EasyAlign)
endif
