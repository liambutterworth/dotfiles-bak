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
set directory=~/.cache/vim/swap//
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
set path+=**
set signcolumn=yes
set shortmess+=c
set spelllang=en_us
set splitbelow splitright
set tags^=./.git/tags;
set undofile undodir=~/.cache/vim/undo//
set updatetime=300
set wildmenu wildignorecase wildmode=list:longest,list:full

let g:mapleader = "\<space>"
let g:netrw_altfile = 1
let g:netrw_dirhistmax = 0
let g:netrw_fastbrowse = 0
let g:vim_indent_cont = &shiftwidth

augroup settings
    autocmd!
    autocmd FileType * setlocal formatoptions-=o

    autocmd BufWinEnter * if &filetype == 'help' || &previewwindow
        \| execute(':resize ' . &lines / 2)
        \| endif

    autocmd BufWinLeave * let b:winview = winsaveview()
    autocmd BufWinEnter * if exists('b:winview')
        \| call winrestview(b:winview)
        \| unlet b:winview
        \| endif
augroup end

"
" Mappings
"

nmap j gj
nmap k gk
nmap Y y$
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

"
" Plugins
"

call plug#begin()

Plug 'airblade/vim-gitgutter'
Plug 'arcticicestudio/nord-vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'michaeljsmith/vim-indent-object'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'raimondi/delimitmate'
Plug 'sheerun/vim-polyglot'
Plug 'suy/vim-context-commentstring'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'

call plug#end()

if has_key(g:plugs, 'coc.nvim')
    let g:coc_global_extensions = [
        \ 'coc-css',
        \ 'coc-html',
        \ 'coc-json',
        \ 'coc-phpls',
        \ 'coc-tsserver',
        \ 'coc-vimlsp',
        \ 'coc-vetur',
        \ ]

    call coc#config('diagnostic', {
        \ 'errorSign': '❯',
        \ 'hintSign': '❯',
        \ 'infoSign': '❯',
        \ 'warningSign': '❯',
        \ })

    nmap gd <plug>(coc-definition)
    nmap gy <plug>(coc-type-definition)
    nmap gi <plug>(coc-implementation)
    nmap gr <plug>(coc-references)
    nmap ]g <plug>(coc-diagnostic-next)
    nmap [g <plug>(coc-diagnostic-prev)

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

if has_key(g:plugs, 'delimitmate')
    let g:delimitMate_expand_cr = 1
    let g:delimitMate_expand_space = 1
endif

if has_key(g:plugs, 'fzf.vim') && executable('fzf')
    set runtimepath+=$ZPLUG_HOME/repos/junegunn/fzf

    let s:git_commit_format = '--format="%C(red)%C(bold)%h%d%C(reset) %s %C(blue)%cr"'
    let g:fzf_commits_log_options = '--graph --color=always ' . s:git_commit_format
    let g:fzf_layout = { 'window': 'call FloatingFZF()' }
    let g:fzf_prefer_tmux = exists('$TMUX')

    let g:fzf_action = {
        \ 'ctrl-t': 'tab split',
        \ 'ctrl-s': 'split',
        \ 'ctrl-v': 'vsplit',
        \ }

    function! FloatingFZF()
        let buf = nvim_create_buf(v:false, v:true)
        let height = float2nr(&lines * 0.8)
        let width = float2nr(&columns * 0.8)
        let horizontal = float2nr((&columns - width) / 2)
        let vertical = 1

        let opts = {
            \ 'relative': 'editor',
            \ 'row': vertical,
            \ 'col': horizontal,
            \ 'height': height,
            \ 'width': width,
            \ }

        call nvim_open_win(buf, v:true, opts)
    endfunction

    command! -bang -nargs=? -complete=dir Files
        \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

    imap <c-x><c-k> <plug>(fzf-complete-word)
    imap <c-x><c-j> <plug>(fzf-complete-file)
    imap <c-x><c-p> <plug>(fzf-complete-path)
    imap <c-x><c-l> <plug>(fzf-complete-line)

    nnoremap <leader><space> :Files<cr>
    nnoremap <leader><tab> :Commits<cr>
    nnoremap <leader><s-tab> :BCommits<cr>
    nnoremap <leader><bs> :Buffers<cr>
    nnoremap <leader><cr> :Rg<cr>
    nnoremap <leader>\ :Maps<cr>
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
