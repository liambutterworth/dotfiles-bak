"
" Vim
"
" :: Settings
" :: Mappings
" :: Plugins

"
" Settings
"

set completeopt=menuone,noinsert,noselect
set dictionary=/usr/share/dict/words
set expandtab
set fillchars+=vert:\ 
set foldenable
set foldmethod=indent
set foldlevelstart=10
set hidden
set ignorecase
set laststatus=0
set lazyredraw
set list
set listchars=tab:│\ ,trail:·
set mouse=n
set nobackup
set nohlsearch
set nojoinspaces
set nowrap
set nowritebackup
set noshowmode
set noswapfile
set number
set omnifunc=syntaxcomplete#Complete
set relativenumber
set runtimepath+=$XDG_CONFIG_HOME/nvim/lua
set signcolumn=yes:1
set shiftwidth=4
set shortmess+=c
set showtabline=0
set smartcase
set softtabstop=4
set splitbelow
set splitright
set termguicolors
set undofile
set wildignorecase wildmode=full

let &helpheight = &lines / 2
let &previewheight = &lines / 2
let g:loaded_netrw = 0
let g:mapleader = "\<space>"
let g:python3_host_prog = $PYTHON3_HOST_PROG
let g:vim_indent_cont = &shiftwidth

augroup settings
    autocmd!
    autocmd FileType * setlocal formatoptions-=o
augroup end

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
nnoremap gQ mmgggq`m
nnoremap <bs> <c-^><c-g>
nnoremap <silent> <leader>r :so $MYVIMRC<cr>
nnoremap <silent> <leader>w :write<cr>
nnoremap <silent> <leader>q :call close#smart()<cr>
nnoremap <silent> <leader>Q :qa!<cr>
nnoremap <silent> <leader>o :only<cr>
nnoremap <silent> <leader>s :split<cr>
nnoremap <silent> <leader>v :vsplit<cr>
nnoremap <silent> <leader>h 20<c-w>>
nnoremap <silent> <leader>j 5<c-w>-
nnoremap <silent> <leader>k 5<c-w>+
nnoremap <silent> <leader>l 20<c-w><
nnoremap <silent> <leader>* :lua print(vim.inspect(vim.treesitter.highlighter.hl_map))<cr>

"
" Plugins
"

if filereadable(expand("$XDG_CONFIG_HOME/nvim/autoload/plug.vim"))
    call plug#begin("$XDG_CONFIG_HOME/nvim/plugged")

    " TODO watch for nord-vim PR for mrswats changes
    " and replace with the original nord-vim

    Plug 'airblade/vim-gitgutter'
    Plug 'christoomey/vim-tmux-navigator'
    Plug 'junegunn/fzf.vim'
    Plug 'junegunn/vim-easy-align',
    Plug 'mrswats/nord-vim'
    Plug 'neovim/nvim-lspconfig'
    Plug 'nvim-treesitter/nvim-treesitter'
    Plug 'nvim-treesitter/nvim-treesitter-textobjects'
    Plug 'preservim/nerdtree'
    Plug 'ryanoasis/vim-devicons'
    Plug 'sirver/ultisnips'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-eunuch'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-repeat'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-unimpaired'

    call plug#end()
end

if exists('g:plugs') && has_key(g:plugs, 'fzf.vim') && executable('fzf')
    let g:fzf_action = { 'ctrl-t': 'tab split', 'ctrl-s': 'split', 'ctrl-v': 'vsplit' }
    let g:fzf_commits_log_format = '--format="%C(red)%h %C(white)%s %C(green)%cr %C(blue)%an"'
    let g:fzf_commits_log_options = '--graph --color=always ' . g:fzf_commits_log_format
    let g:fzf_layout = { 'down': '40%' }
    let g:fzf_prefer_tmux = exists('$TMUX')

    command! -bang Commits
        \ call fzf#vim#commits({'options': '--no-preview'}, <bang>0)

    command! -bang BCommits
        \ call fzf#vim#commits({'options': '--no-preview'}, <bang>0)

    command! -bang -nargs=? -complete=dir Files
        \ call fzf#vim#files(<q-args>, <bang>0)

    imap <c-x><c-k> <plug>(fzf-complete-word)
    imap <c-x><c-j> <plug>(fzf-complete-file)
    imap <c-x><c-p> <plug>(fzf-complete-path)
    imap <c-x><c-l> <plug>(fzf-complete-line)

    nnoremap <space><space> :Files<cr>
    nnoremap <space><tab> :Snippets<cr>
    nnoremap <space><bs> :Buffers<cr>
    nnoremap <space><cr> :GFiles<cr>
    nnoremap <space>\ :Commits!<cr>
    nnoremap <space>\| :BCommits!<cr>
    nnoremap <space>- :History<cr>
    nnoremap <space>/ :History/<cr>
    nnoremap <space>: :History:<cr>
    nnoremap <space>? :Helptags<cr>
    nnoremap <space>] :Tags<cr>
    nnoremap <space>} :BTags<cr>
    nnoremap <space>` :Marks<cr>
    nnoremap <space>g :Lines<cr>
    nnoremap <space>G :BLines<cr>
endif

if exists('g:plugs') && has_key(g:plugs, 'nord-vim')
    silent! colorscheme nord

    highlight CursorLineNr guibg=none
    highlight Normal guibg=none
    highlight SignColumn guibg=none
    highlight VertSplit guibg=#3b4252
    highlight Pmenu guibg=#3b4252
    highlight StatusLine guibg=#3b4252 guifg=#e5e9f0
    highlight StatusLineNc guibg=#3b4252 guifg=#e5e9f0
end

if exists('g:plugs') && has_key(g:plugs, 'nvim-lspconfig')
    lua require 'lsp'
end

if exists('g:plugs') && has_key(g:plugs, 'nvim-treesitter')
    lua require 'treesitter'
end

if exists('g:plugs') && has_key(g:plugs, 'nerdtree')
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
    nnoremap <silent> \\ :Git<cr>
    nnoremap <silent> \b :Gblame<cr>
    nnoremap <silent> \c :Gcommit<cr>
    nnoremap <silent> \d :Ghdiffsplit<cr>
    nnoremap <silent> \e :Gedit<cr>
    nnoremap <silent> \l :0Glog<cr>
    nnoremap <silent> \r :Gcd<cr>
    nnoremap <silent> \w :Gwrite<cr>
endif

if exists('g:plugs') && has_key(g:plugs, 'vim-gitgutter')
    let g:gitgutter_map_keys = 0

    nmap ]c <plug>(GitGutterNextHunk)
    nmap [c <plug>(GitGutterPrevHunk)
    omap ic <plug>(GitGutterTextObjectInnerPending)
    omap ac <plug>(GitGutterTextObjectOuterPending)
    xmap ic <plug>(GitGutterTextObjectInnerVisual)
    xmap ac <plug>(GitGutterTextObjectInnerVisual)

    highlight GitGutterAdd guibg=none guifg=#b8bb26
    highlight GitGutterChange guibg=none guifg=#fabd2f
    highlight GitGutterDelete guibg=none guifg=#fb4934
    highlight GitGutterChangeDelete guibg=none guifg=#fabd2f
endif
