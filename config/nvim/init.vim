"
" Vim
"
" :: Settings
" :: Commands
" :: Mappings
" :: Plugins

"
" Settings
"

set completeopt=menuone,noselect
set dictionary=/usr/share/dict/words
set expandtab shiftwidth=4 softtabstop=4
set fillchars+=vert:\ 
set foldenable foldmethod=indent foldlevelstart=10
set hidden
set ignorecase smartcase
set laststatus=0 showtabline=0
set list listchars=tab:│\ ,trail:·
set mouse=n
set nobackup noswapfile nowritebackup
set nohlsearch
set nojoinspaces
set nowrap
set noshowmode
set number relativenumber
set omnifunc=syntaxcomplete#Complete
set runtimepath+=$XDG_CONFIG_HOME/nvim/lua
set signcolumn=yes:1
set shortmess+=c
set smartindent
set splitbelow splitright
set tags=./git/tags
set undofile
set wildignorecase wildmode=full

"
" Commands
"

autocmd FileType * setlocal formatoptions-=o
autocmd TermOpen * setlocal nonumber norelativenumber | startinsert
autocmd BufEnter * if &buftype == 'terminal' | :startinsert | endif

"
" Mappings
"

nnoremap j gj
nnoremap k gk
nnoremap Y y$
nnoremap Q @q
nnoremap c* *``cgn
nnoremap c# #``cgN
nnoremap d* *``dgn
nnoremap d# #``dgN
nnoremap g= mmgg=G`m
nnoremap gQ mmgggq`
nnoremap <bs> <c-^>
nnoremap <c-s> :write<cr>
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
nnoremap <c-w>d :bwipe<cr>
nnoremap <c-w>D :bwipe!<cr>
nnoremap <c-w>Q :quit!<cr>
nnoremap <c-w>C :close!<cr>
nnoremap <c-w>h 10<c-w><
nnoremap <c-w>j 5<c-w>+
nnoremap <c-w>k 5<c-w>-
nnoremap <c-w>l 10<c-w>>
nnoremap \\ :term<cr>
nnoremap \s :split<cr>:term<cr>
nnoremap \v :vsplit<cr>:term<cr>
tnoremap <c-\> <c-\><c-n>

" TODO remove
let mapleader = ' '
nnoremap <leader>w :write<cr>
nnoremap <leader>W :writeall<cr>
nnoremap <leader>q :quit<cr>
nnoremap <leader>Q :quit!<cr>
nnoremap <leader>d :bwipe<cr>
nnoremap <leader>D :bwipe!<cr>
nnoremap <leader>e :close<cr>
nnoremap <leader>E :close!<cr>
nnoremap <silent> <leader>r :so $MYVIMRC<cr>
nnoremap <silent> <leader>g :Goyo<cr>
nnoremap <leader>H :so $VIMRUNTIME/syntax/hitest.vim<cr>
map <leader>h :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
    \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
    \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

"
" Plugins
"

if filereadable(expand("$XDG_DATA_HOME/nvim/site/autoload/plug.vim"))
    call plug#begin()

    Plug 'airblade/vim-gitgutter'
    Plug 'hrsh7th/nvim-compe'
    Plug 'junegunn/fzf'
    Plug 'junegunn/fzf.vim'
    Plug 'junegunn/goyo.vim'
    Plug 'junegunn/limelight.vim'
    Plug 'junegunn/vim-easy-align',
    Plug 'michaeljsmith/vim-indent-object'
    Plug 'neovim/nvim-lspconfig'
    Plug 'preservim/nerdtree'
    Plug 'ryanoasis/vim-devicons'
    Plug 'sheerun/vim-polyglot'
    Plug 'sirver/ultisnips'
    Plug 'tomtom/tcomment_vim'
    Plug 'tpope/vim-eunuch'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-repeat'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-unimpaired'

    call plug#end()
end

colorscheme custom

if exists('g:plugs') && has_key(g:plugs, 'fzf.vim') && executable('fzf')
    let g:fzf_action = { 'ctrl-t': 'tab split', 'ctrl-s': 'split', 'ctrl-v': 'vsplit' }
    let g:fzf_commits_log_format = '--format="%C(red)%h %C(white)%s %C(green)%cr %C(blue)%an"'
    let g:fzf_commits_log_options = '--graph --color=always ' . g:fzf_commits_log_format
    let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8, 'border': 'sharp' } }

    command! -bang -nargs=? -complete=dir Files call fzf#vim#files(<q-args>, <bang>0)
    command! -bang Buffers call fzf#vim#buffers({ 'options': '--no-preview' }, <bang>0)
    command! -bang Commits call fzf#vim#commits({ 'options': '--no-preview' }, <bang>0)

    command! -bang -nargs=* Rg call fzf#vim#grep(
        \ 'rg --column --color=always --smart-case '
        \ . shellescape(<q-args>), 1, <bang>0)

    imap <c-x><c-k> <plug>(fzf-complete-word)
    imap <c-x><c-j> <plug>(fzf-complete-file)
    imap <c-x><c-p> <plug>(fzf-complete-path)
    imap <c-x><c-l> <plug>(fzf-complete-line)

    nnoremap <space><space> :Rg<cr>
    nnoremap <space><tab> :Snippets<cr>
    nnoremap <space><bs> :Buffers<cr>
    nnoremap <space><cr> :Files<cr>
    nnoremap <space>: :History:<cr>
    nnoremap <space>? :Helptags<cr>
    nnoremap <space>g :Commits!<cr>
    nnoremap <space>l :Lines<cr>
endif

if exists('g:plugs') && has_key(g:plugs, 'goyo.vim')
    let g:limelight_conceal_ctermfg = 8

    nnoremap - :Goyo<cr>

    autocmd User GoyoEnter Limelight
    autocmd User GoyoLeave Limelight! | colorscheme custom
end

if exists('g:plugs') && has_key(g:plugs, 'nvim-lspconfig')
    lua require 'lsp'
end

if exists('g:plugs') && has_key(g:plugs, 'nerdtree')
    let g:NERDTreeBookmarksFile = "$XDG_CACHE_HOME/nvim/NerdTreeBookmarks"

    nnoremap <silent> <cr><cr> :NERDTreeToggle<cr>
    nnoremap <silent> <cr>c :NERDTreeClose<cr>
    nnoremap <silent> <cr>r :NERDTreeRefreshRoot<cr>

    nnoremap <expr> <cr>w exists('b:NERDTree')
        \ ? '<c-w><c-p>'
        \ : ':NERDTreeFocus'

    nnoremap <expr> <cr>f exists('b:NERDTree')
        \ ? '<c-w><c-p>:NERDTreeFind<cr>'
        \ : ':NERDTreeFind<cr>'
endif

if exists('g:plugs') && has_key(g:plugs, 'ultisnips')
    let g:UltiSnipsSnippetDirectories = [ $XDG_CONFIG_HOME . '/nvim/ultisnips' ]
    let g:UltiSnipsExpandTrigger = '<tab>'
    let g:UltiSnipsJumpForwardTrigger = '<c-j>'
    let g:UltiSnipsJumpBackwardTrigger = '<c-k>'

    nnoremap <s-tab> :UltiSnipsEdit<cr>
endif

if exists('g:plugs') && has_key(g:plugs, 'vim-easy-align')
    nmap ga <Plug>(EasyAlign)
    xmap ga <Plug>(EasyAlign)
endif

if exists('g:plugs') && has_key(g:plugs, 'vim-fugitive')
    nnoremap gs :Git<cr>
    nnoremap gl :Gclog<cr>
endif

if exists('g:plugs') && has_key(g:plugs, 'vim-gitgutter')
    let g:gitgutter_map_keys = 0

    nmap ]c <plug>(GitGutterNextHunk)
    nmap [c <plug>(GitGutterPrevHunk)
    omap ic <plug>(GitGutterTextObjectInnerPending)
    omap ac <plug>(GitGutterTextObjectOuterPending)
    xmap ic <plug>(GitGutterTextObjectInnerVisual)
    xmap ac <plug>(GitGutterTextObjectInnerVisual)
endif
