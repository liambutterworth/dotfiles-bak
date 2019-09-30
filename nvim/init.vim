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

let &helpheight = &lines / 2
let &previewheight = &lines / 2
let g:mapleader = "\<space>"
let g:netrw_altfile = 1
let g:netrw_dirhistmax = 0
let g:netrw_fastbrowse = 0
let g:python_host_prog = substitute(system('which python'), '\n', '', 'g')
let g:python3_host_prog = substitute(system('which python3'), '\n', '', 'g')
let g:ruby_host_prog = substitute(system('which ruby'), '\n', '', 'g')
let g:vim_indent_cont = &shiftwidth
let g:vim_plugs_dir = $HOME . '/.config/nvim/plugs'
let g:vim_snips_dir = $HOME . '/.config/nvim/snips'

augroup settings
    autocmd!
    autocmd FileType * setlocal formatoptions-=o
    autocmd BufLeave * let b:winview = winsaveview()
    autocmd BufEnter * if (exists('b:winview')) | call winrestview(b:winview) | endif
augroup end

"
" Mappings
"

nmap j gj
nmap k gk
nmap Y y$
nmap Q @q
nmap <bs> <c-^>
nmap c* *``cgn
nmap c# #``cgN
nmap d* *``dgn
nmap d# #``dgN
nmap g= mmgg=G`m

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

inoremap <silent> <c-e><cr> <cr><esc>O
inoremap <silent> <c-e><bs> <esc>ddkJciw
inoremap <silent> <c-e>; <esc>mm:s/\v(.)$/\=submatch(1)==';'?'':submatch(1).';'<cr>`ma
inoremap <silent> <c-e>, <esc>mm:s/\v(.)$/\=submatch(1)==','?'':submatch(1).','<cr>`ma

"
" Plugins
"

call plug#begin(g:vim_plugs_dir)

Plug 'airblade/vim-gitgutter'
Plug 'arcticicestudio/nord-vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'junegunn/fzf', { 'do': './install --all --xdg --no-bash --no-zsh' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'michaeljsmith/vim-indent-object'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'sheerun/vim-polyglot'
Plug 'sirver/ultisnips'
Plug 'suy/vim-context-commentstring'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'

call plug#end()

if has_key(g:plugs, 'coc.nvim')
    let g:coc_global_extensions = [
        \ 'coc-css',
        \ 'coc-docker',
        \ 'coc-html',
        \ 'coc-json',
        \ 'coc-phpls',
        \ 'coc-tsserver',
        \ 'coc-ultisnips',
        \ 'coc-vimlsp',
        \ 'coc-vetur',
        \ 'coc-yaml',
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

    nnoremap <silent><expr> <c-e> coc#util#has_float() 
        \ ? coc#util#float_scroll(1) : "\<c-e>"

    nnoremap <silent><expr> <c-y> coc#util#has_float() 
        \ ? coc#util#float_scroll(0) : "\<c-y>"
endif

if has_key(g:plugs, 'fzf.vim') && executable('fzf')
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
    nnoremap <leader><cr> :Commits<cr>
    nnoremap <leader>/ :History/<cr>
    nnoremap <leader>: :History:<cr>
    nnoremap <leader>? :Helptags<cr>
    nnoremap <leader>` :Marks<cr>
endif

if has_key(g:plugs, 'nord-vim') && isdirectory(g:vim_plugs_dir) 
    let g:nord_bold_vertical_split_line = 1
    let g:nord_italic = 1
    let g:nord_italic_comments = 1
    let g:nord_underline = 1

    colorscheme nord

    highlight StatusLine ctermfg=0 ctermbg=0
    highlight StatusLineNC ctermfg=0 ctermbg=0
endif

if has_key(g:plugs, 'ultisnips') && isdirectory(g:vim_snips_dir)
    let g:UltiSnipsSnippetDirectories = [g:vim_snips_dir]
    let g:UltiSnipsExpandTrigger = '<tab>'
    let g:UltiSnipsJumpForwardTrigger = '<c-j>'
    let g:UltiSnipsJumpBackwardTrigger = '<c-k>'

    nnoremap <s-tab> :UltiSnipsEdit<cr>
endif

if has_key(g:plugs, 'vim-context-commentstring')
    let g:context#commentstring#table = {}

    let g:context#commentstring#table['html'] = {
        \ 'javaScript'  : '// %s',
        \ 'cssStyle'    : '/* %s */',
        \ }

    let g:context#commentstring#table['javascript'] = {
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

if has_key(g:plugs, 'vim-fugitive')
    nnoremap <silent> <cr>b :Gblame<cr>
    nnoremap <silent> <cr>d :Ghdiffsplit<cr>
    nnoremap <silent> <cr>s :Gstatus<cr>
    nnoremap <silent> <cr>q :diffoff!<cr><c-w>j<c-w>o
endif
