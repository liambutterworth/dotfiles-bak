"
" Vim Config
"
" :: Settings
" :: Mappings
" :: Plugins

"
" Settings
"

filetype plugin indent on
syntax enable

set autoread
set autoindent
set backspace=indent,eol,start
set complete=.,w,b,u,t,k
set completeopt-=preview
set dictionary=/usr/share/dict/words
set directory=~/.cache/vim/swap//
set encoding=utf-8
set expandtab shiftwidth=4 softtabstop=4
set fillchars+=vert:\ 
set foldenable foldmethod=indent foldlevelstart=99
set hidden
set incsearch
set ignorecase smartcase
set laststatus=2
set lazyredraw
set list listchars=tab:│\ ,trail:·
set nobackup nowritebackup
set nojoinspaces
set nowrap
set number relativenumber
set signcolumn=yes
set shortmess+=c
set spelllang=en_us
set splitbelow splitright
set statusline=%!ui#statusline()
set tabline=%!ui#tabline()
set undofile undodir=~/.cache/vim/undo//
set updatetime=300
set viminfo+=n~/.cache/vim/viminfo
set wildmenu wildignorecase wildmode=full

let mapleader = ' '
let g:vim_indent_cont = &shiftwidth
let g:netrw_home = $HOME . '/.cache/vim/'

augroup settings
    autocmd!
    autocmd filetype * setlocal formatoptions-=o
    autocmd bufread,bufnewfile */zsh/* setlocal filetype=zsh
augroup end

"
" Mappings
"

nnoremap j gj
nnoremap k gk
nnoremap Y y$
nnoremap <bs> <c-^>
nnoremap c* *``cgn
nnoremap c# #``cgN
nnoremap d* *``dgn
nnoremap d# #``dgN
nnoremap g= mmgg=G`m

nnoremap ]<bs> :bnext<cr>
nnoremap [<bs> :bprevious<cr>
nnoremap ]<space> o<esc>'[k
nnoremap [<space> O<esc>j
nnoremap ]e :<c-u>call line#move('n', 'down', v:count)<cr>
nnoremap [e :<c-u>call line#move('n', 'up', v:count)<cr>
vnoremap ]e :<c-u>call line#move('v', 'down', v:count)<cr>
vnoremap [e :<c-u>call line#move('v', 'up', v:count)<cr>

nnoremap <leader>t :tabe %<cr>
nnoremap <leader>s :split<cr>
nnoremap <leader>v :vsplit<cr>
nnoremap <leader>p :tabp<cr>
nnoremap <leader>n :tabn<cr>
nnoremap <leader>P :tabm -1<cr>
nnoremap <leader>N :tabm +1<cr>
nnoremap <leader>h <c-w>10<
nnoremap <leader>j <c-w>10-
nnoremap <leader>k <c-w>10+
nnoremap <leader>l <c-w>10>

nnoremap <leader>ow :set wrap!<cr>
nnoremap <leader>os :set spell!<cr>
nnoremap <leader>oh :set hlsearch!<cr>
nnoremap <leader>oi :set ignorecase!<cr>
nnoremap <leader>or :set relativenumber!<cr>
nnoremap <leader>ol :set cursorline!<cr>
nnoremap <leader>oc :set cursorcolumn!<cr>
nnoremap <leader>om :exec 'set mouse=' . (&mouse == '' ? 'n' : '')<cr>

inoremap <c-j> <nop>
nnoremap <c-j>; m`:call line#ender(';')<cr>``
nnoremap <c-j>, m`:call line#ender(',')<cr>``
nnoremap <c-j>' m`:call line#ender("''")<cr>``
vnoremap <c-j>; :call line#ender(';')<cr>gv
vnoremap <c-j>, :call line#ender(',')<cr>gv
vnoremap <c-j>' :call line#ender("'")<cr>gv
inoremap <c-j>; <esc>m`:call line#ender(';')<cr>``a
inoremap <c-j>, <esc>m`:call line#ender(',')<cr>``a
inoremap <c-j>' <esc>m`:call line#ender("''")<cr>``a

"
" Plugins
"

call plug#begin('~/.vim/plugs')

Plug 'airblade/vim-gitgutter'
Plug 'arcticicestudio/nord-vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'jwalton512/vim-blade'
Plug 'michaeljsmith/vim-indent-object'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'pangloss/vim-javascript'
Plug 'Raimondi/delimitMate'
Plug 'SirVer/ultisnips'
Plug 'suy/vim-context-commentstring'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'

call plug#end()

if has_key(g:plugs, 'coc.nvim')
    let g:coc_global_extensions = [
        \ 'coc-vimlsp',
        \ 'coc-html',
        \ 'coc-css',
        \ 'coc-tsserver',
        \ 'coc-vetur',
        \ 'coc-json',
        \ 'coc-phpls',
        \ ]

    nmap gd <plug>(coc-definition)
    nmap gy <plug>(coc-type-definition)
    nmap gi <plug>(coc-implementation)
    nmap gr <plug>(coc-references)

    nnoremap ]c <plug>(coc-diagnostic-next)
    nnoremap [c <plug>(coc-diagnostic-prev)

    nnoremap <expr> K index(['vim', 'help'], &filetype) >= 0
        \ ? ":execute 'help ' . expand('<cword>')<cr>"
        \ : ":call CocAction('doHover')<cr>"
endif

if has_key(g:plugs, 'delimitmate')
    let g:delimitMate_expand_cr = 1
    let g:delimitMate_expand_space = 1
endif

if has_key(g:plugs, 'fzf.vim') && executable('fzf')
    set runtimepath+=$ZPLUG_HOME/repos/junegunn/fzf

    let s:git_commit_format = '--format="%C(red)%C(bold)%h%d%C(reset) %s %C(blue)%cr"'
    let g:fzf_commits_log_options = '--graph --color=always ' . s:git_commit_format
    let g:fzf_tags_command = 'ctags -R'
    let g:fzf_prefer_tmux = 1

    let g:fzf_action = {
        \ 'ctrl-t': 'tab split',
        \ 'ctrl-s': 'split',
        \ 'ctrl-v': 'vsplit',
        \ }

    command! -bang -nargs=? -complete=dir Files
        \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

    imap <c-x><c-k> <plug>(fzf-complete-word)
    imap <c-x><c-j> <plug>(fzf-complete-file)
    imap <c-x><c-f> <plug>(fzf-complete-path)
    imap <c-x><c-l> <plug>(fzf-complete-line)

    nnoremap <leader><space> :Files<cr>
    nnoremap <leader><tab> :Snippets<cr>
    nnoremap <leader><bs> :Buffers<cr>
    nnoremap <leader><cr> :Rg<cr>
    nnoremap <leader>\ :Commits<cr>
    nnoremap <leader>/ :History/<cr>
    nnoremap <leader>: :History:<cr>
    nnoremap <leader>? :Helptags<cr>
    nnoremap <leader>] :Tags<cr>
    nnoremap <leader>` :Marks<cr>
    nnoremap <leader>G :Lines<cr>
endif

if has_key(g:plugs, 'nord-vim')
    let g:nord_italic = 1
    let g:nord_underline = 1
    let g:nord_uniform_diff_background = 1
    let g:nord_bold_vertical_split_line = 1

    colorscheme nord
endif

if has_key(g:plugs, 'ultisnips')
    let g:UltiSnipsSnippetDirectories = [$HOME . '/.vim/snips']
    let g:UltiSnipsExpandTrigger = '<tab>'
    let g:UltiSnipsJumpForwardTrigger = '<c-j>'
    let g:UltiSnipsJumpBackwardTrigger = '<c-k>'

    nnoremap <leader><s-tab> :UltiSnipsEdit<cr>
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
        \ 'phpVarSelector' : '// %s'
        \ }
endif

if has_key(g:plugs, 'vim-easy-align')
    xmap ga <plug>(EasyAlign)
    nmap ga <plug>(EasyAlign)
endif

if has_key(g:plugs, 'vim-gitgutter')
    let g:gitgutter_map_keys = 0

    nnoremap ]h <plug>GitGutterNextHunk
    nnoremap [h <plug>GitGutterPrevHunk

    omap ih <plug>GitGutterTextObjectInnerPending
    omap ah <plug>GitGutterTextObjectOuterPending
    xmap ih <plug>GitGutterTextObjectInnerVisual
    xmap ah <plug>GitGutterTextObjectOuterVisual
endif

if has_key(g:plugs, 'vim-javascript')
    let g:javascript_plugin_jsdoc = 1
endif
