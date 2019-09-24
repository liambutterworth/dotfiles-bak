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
set mouse=n
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
let g:python3_host_prog = substitute(system('which python3'), '\n', '', 'g')
let g:vim_indent_cont = &shiftwidth

augroup settings
    autocmd!
    autocmd FileType * setlocal formatoptions-=o

    autocmd BufWinEnter * if &filetype == 'help' || &previewwindow
        \| execute(':resize ' . &lines / 2)
        \| endif
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

nnoremap <leader>q :quit<cr>
nnoremap <leader>Q :quit!<cr>
nnoremap <leader>t :tabedit<cr>
nnoremap <leader>s :split<cr>
nnoremap <leader>v :vsplit<cr>
nnoremap <leader>p :tabprevious<cr>
nnoremap <leader>n :tabnext<cr>
nnoremap <leader>P :-tabmove<cr>
nnoremap <leader>N :+tabmove<cr>
nnoremap <leader>h 5<c-w><
nnoremap <leader>j 5<c-w>-
nnoremap <leader>k 5<c-w>+
nnoremap <leader>l 5<c-w>>

nnoremap <silent> [<bs> :bprevious<cr>
nnoremap <silent> ]<bs> :bnext<cr>
nnoremap <silent> [<space> O<esc>j
nnoremap <silent> ]<space> o<esc>'[k

"
" Plugins
"

call plug#begin('~/.config/nvim/plugs')

Plug 'airblade/vim-gitgutter'
Plug 'arcticicestudio/nord-vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'michaeljsmith/vim-indent-object'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'sheerun/vim-polyglot'
Plug 'sirver/ultisnips'
Plug 'suy/vim-context-commentstring'
Plug 'tmsvg/pear-tree'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'


call plug#end()

if has_key(g:plugs, 'pear-tree')
    let g:pear_tree_repeatable_expand = 0
    let g:pear_tree_smart_openers = 1
    let g:pear_tree_smart_closers = 1
    let g:pear_tree_smart_backspace = 1
endif

if has_key(g:plugs, 'coc.nvim')
    let g:coc_global_extensions = [
        \ 'coc-css',
        \ 'coc-html',
        \ 'coc-json',
        \ 'coc-phpls',
        \ 'coc-snippets',
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

    nnoremap <expr><c-e> coc#util#has_float() ? coc#util#float_scroll(1) : "\<c-e>"
    nnoremap <expr><c-y> coc#util#has_float() ? coc#util#float_scroll(0) : "\<c-y>"
    nnoremap <expr><c-d> coc#util#has_float() ? coc#util#float_scroll(1) : "\<c-d>"
    nnoremap <expr><c-u> coc#util#has_float() ? coc#util#float_scroll(0) : "\<c-u>"
    nnoremap <expr><c-f> coc#util#has_float() ? coc#util#float_scroll(1) : "\<c-f>"
    nnoremap <expr><c-b> coc#util#has_float() ? coc#util#float_scroll(0) : "\<c-b>"
endif

if has_key(g:plugs, 'fzf.vim') && executable('fzf')
    set runtimepath+=$PACKAGES/fzf

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
    nnoremap <leader><tab> :Snippets<cr>
    nnoremap <leader><bs> :Buffers<cr>
    nnoremap <leader><cr> :Rg<cr>
    nnoremap <leader>\ :Commits<cr>
    nnoremap <leader>/ :History/<cr>
    nnoremap <leader>: :History:<cr>
    nnoremap <leader>? :Helptags<cr>
    nnoremap <leader>` :Marks<cr>
    nnoremap <leader>g :Lines<cr>
    nnoremap <leader>G :BLines<cr>
endif

if has_key(g:plugs, 'nord-vim')
    let g:nord_bold_vertical_split_line = 1
    let g:nord_italic = 1
    let g:nord_italic_comments = 1
    let g:nord_underline = 1

    colorscheme nord

    highlight StatusLine ctermfg=0 ctermbg=0
    highlight StatusLineNC ctermfg=0 ctermbg=0
endif

if has_key(g:plugs, 'ultisnips')
    let g:UltiSnipsSnippetDirectories = ['snips']
    let g:UltiSnipsSnippetExpandTrigger = '<tab>'
    let g:UltiSnipsJumpForwardTrigger = '<c-j>'
    let g:UltiSnipsJumpBackwardTrigger = '<c-k>'
endif

if has_key(g:plugs, 'vim-context-commentstring')
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

if has_key(g:plugs, 'vim-easy-align')
    xmap ga <plug>(EasyAlign)
    nmap ga <plug>(EasyAlign)
endif
