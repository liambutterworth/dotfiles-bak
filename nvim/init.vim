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
set foldenable foldmethod=indent foldlevelstart=10
set hidden
set incsearch
set ignorecase smartcase
set lazyredraw
set list listchars=tab:│\ ,trail:·
set mouse=n
set nobackup nowritebackup
set nohlsearch
set nojoinspaces
set nowrap
set noshowmode
set number relativenumber
set omnifunc=syntaxcomplete#Complete
set signcolumn=yes
set shortmess+=c
set spelllang=en_us
set splitbelow splitright
set tags=./.git/tags;
set termguicolors
set undofile undodir=~/.cache/nvim/undo//
set updatetime=100
set wildmenu wildignorecase wildmode=full

let &helpheight = &lines / 2
let &previewheight = &lines / 2
let g:mapleader = "\<space>"
let g:netrw_altfile = 1
let g:netrw_altv = 1
let g:netrw_dirhistmax = 0
let g:netrw_fastbrowse = 0
let g:netrw_winsize = 20
let g:python_host_prog = $PYTHON_HOST_PROG
let g:python3_host_prog = $PYTHON3_HOST_PROG
let g:ruby_host_prog = $RUBY_HOST_PROG
let g:vim_indent_cont = &shiftwidth

augroup settings
    autocmd!
    autocmd FileType * setlocal formatoptions-=o
    autocmd BufLeave * let b:winview = winsaveview()
    autocmd BufEnter * if (exists('b:winview')) | call winrestview(b:winview)
    autocmd BufRead,BufNewFile ~/.dotfiles/git/config set filetype=gitconfig
augroup end

"
" Mappings
"

nnoremap <bs> <c-^>
nnoremap <up> <c-u>
nnoremap <down> <c-d>
nnoremap <left> <c-y>
nnoremap <right> <c-e>

nnoremap j gj
nnoremap k gk
nnoremap Y y$
nnoremap Q @q
nnoremap c* *``cgn
nnoremap c# #``cgN
nnoremap d* *``dgn
nnoremap d# #``dgN
nnoremap g= mmgg=G`m
nnoremap gj :!jq .<cr>
xnoremap gj :'<,'>!jq<cr>
nnoremap gQ mmgggq`m
nnoremap gs yiw:%s/<c-r>"//g<left><left>
xnoremap gs y:%s/<c-r>"//g<left><left>

nnoremap <silent> <leader>r :so $MYVIMRC<cr>
nnoremap <silent> <leader>e :e<cr>
nnoremap <silent> <leader>w :write<cr>
nnoremap <silent> <leader>q :call close#smart()<cr>
nnoremap <silent> <leader>o :only<cr>
nnoremap <silent> <leader>s :split<cr>
nnoremap <silent> <leader>v :vsplit<cr>
nnoremap <silent> <leader>t :tabedit<cr>
nnoremap <silent> <leader>p :tabprevious<cr>
nnoremap <silent> <leader>n :tabnext<cr>
nnoremap <silent> <leader>P :tabmove -1<cr>
nnoremap <silent> <leader>N :tabmove +1<cr>
nnoremap <silent> <leader>h 20<c-w>>
nnoremap <silent> <leader>j 5<c-w>-
nnoremap <silent> <leader>k 5<c-w>+
nnoremap <silent> <leader>l 20<c-w><

" echo the highlight region name under cursor
map <leader>H :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
    \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
    \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

"
" Plugins
"

call plug#begin($HOME . '/.config/nvim/plugged')

Plug 'airblade/vim-gitgutter'
Plug 'cakebaker/scss-syntax.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'georgewitteman/vim-fish'
Plug 'gruvbox-community/gruvbox'
Plug 'junegunn/fzf', { 'do': './install --all --no-bash --no-zsh' }
Plug 'junegunn/fzf.vim'
Plug 'jwalton512/vim-blade'
Plug 'michaeljsmith/vim-indent-object'
Plug 'pangloss/vim-javascript'
Plug 'posva/vim-vue'
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'sirver/ultisnips'
Plug 'stanangeloff/php.vim'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

if has_key(g:plugs, 'fzf.vim') && executable('fzf')
    let g:fzf_action = { 'ctrl-t': 'tab split', 'ctrl-s': 'split', 'ctrl-v': 'vsplit' }
    let g:fzf_commits_log_format = '--format="%C(red)%h %C(white)%s %C(green)%cr %C(blue)%an"'
    let g:fzf_commits_log_options = '--graph --color=always ' . g:fzf_commits_log_format
    let g:fzf_prefer_tmux = exists('$TMUX')

    command! -bang Commits call fzf#vim#commits({'options': '--no-preview'}, <bang>0)
    command! -bang BCommits call fzf#vim#commits({'options': '--no-preview'}, <bang>0)

    command! -bang -nargs=? -complete=dir Files
        \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

    imap <c-x><c-k> <plug>(fzf-complete-word)
    imap <c-x><c-j> <plug>(fzf-complete-file)
    imap <c-x><c-p> <plug>(fzf-complete-path)
    imap <c-x><c-l> <plug>(fzf-complete-line)

    nnoremap <leader><space> :Files<cr>
    nnoremap <leader><tab> :Snippets<cr>
    nnoremap <leader><bs> :Buffers<cr>
    nnoremap <leader><cr> :GFiles<cr>
    nnoremap <leader>\ :Commits!<cr>
    nnoremap <leader>\| :BCommits!<cr>
    nnoremap <leader>- :History<cr>
    nnoremap <leader>/ :History/<cr>
    nnoremap <leader>: :History:<cr>
    nnoremap <leader>? :Helptags<cr>
    nnoremap <leader>] :Tags<cr>
    nnoremap <leader>} :BTags<cr>
    nnoremap <leader>` :Marks<cr>
    nnoremap <leader>g :Lines<cr>
    nnoremap <leader>G :BLines<cr>
endif

if has_key(g:plugs, 'gruvbox')
    silent! colorscheme gruvbox

    unlet g:fzf_colors

    highlight CursorLineNr guibg=none
    highlight GitGutterAdd guibg=none guifg=#fabd2f
    highlight GitGutterChange guibg=none guifg=#fabd2f
    highlight GitGutterDelete guibg=none guifg=#fb4934
    highlight GitGutterChangeDelete guibg=none guifg=#fabd2f
    highlight Normal guibg=none
    highlight SignColumn guibg=none
    highlight VertSplit guibg=#3c3836
endif

if has_key(g:plugs, 'php.vim')
    let php_var_selector_is_identifier = 1
endif

if has_key(g:plugs, 'ultisnips')
    let g:UltiSnipsSnippetDirectories = [ $HOME . '/.config/nvim/ultisnips' ]
    let g:UltiSnipsExpandTrigger = '<tab>'
    let g:UltiSnipsJumpForwardTrigger = '<c-j>'
    let g:UltiSnipsJumpBackwardTrigger = '<c-k>'

    nnoremap <s-tab> :UltiSnipsEdit<cr>
endif

if has_key(g:plugs, 'nerdtree')
    let g:NERDTreeWinSize = 35 
    let g:NERDTreeShowLineNumbers = 1

    nnoremap <cr><cr> :NERDTreeToggle<cr>
    nnoremap <cr>g :NERDTreeVCS<cr>
    nnoremap <cr>r :NERDTreeRefreshRoot<cr>

    nnoremap <expr> <cr>f exists('b:NERDTree')
        \ ? '<c-w><c-p>:NERDTreeFind<cr>'
        \ : ':NERDTreeFind<cr>'

    autocmd BufEnter * if (
        \ winnr("$") == 1 &&
        \ exists("b:NERDTree") &&
        \ b:NERDTree.isTabTree()
        \ ) | q | endif
endif

if has_key(g:plugs, 'vim-airline')
    let g:airline_powerline_fonts = 1
    let g:airline_left_sep = ''
    let g:airline_right_sep = ''
    let g:airline#extensions#fugitiveline#enabled = 1
    let g:airline#extensions#whitespace#checks = []

    let g:airline_filetype_overrides = {
        \ 'nerdtree': [ get(g:, 'NERDTreeStatusline', 'NERD'), '' ],
        \ }

    nnoremap <silent> <leader>r :so $MYVIMRC<cr>:AirlineToggle<cr>:AirlineToggle<cr>
endif

if has_key(g:plugs, 'vim-fugitive')
    nnoremap <silent> \\ :Gstatus<cr>
    nnoremap <silent> \b :Gblame<cr>
    nnoremap <silent> \c :Gcommit<cr>
    nnoremap <silent> \d :Ghdiffsplit<cr>
    nnoremap <silent> \e :Gedit<cr>
    nnoremap <silent> \l :0Glog<cr>
    nnoremap <silent> \r :Gcd<cr>
    nnoremap <silent> \w :Gwrite<cr>
endif

if has_key(g:plugs, 'vim-gitgutter')
    let g:gitgutter_map_keys = 0

    nmap ]c <plug>(GitGutterNextHunk)
    nmap [c <plug>(GitGutterPrevHunk)
    omap ic <plug>(GitGutterTextObjectInnerPending)
    omap ac <plug>(GitGutterTextObjectOuterPending)
    xmap ic <plug>(GitGutterTextObjectInnerVisual)
    xmap ac <plug>(GitGutterTextObjectInnerVisual)
endif

if has_key(g:plugs, 'vim-javasript')
    let g:javascript_plugin_doc = 1
end
