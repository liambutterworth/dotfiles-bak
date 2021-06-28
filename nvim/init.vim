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

let g:netrw_dirhistmax = 0
let g:netrw_fastbrowse = 0
let g:python3_host_prog = $PYTHON3_HOST_PROG
let g:vim_indent_cont = &shiftwidth

"
" Mappings
"

nnoremap <bs> <c-^>
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
nnoremap gs yiw:%s/<c-r>"//g<left><left>
xnoremap gs y:%s/<c-r>"//g<left><left>

"
" Plugins
"

if filereadable(expand("$XDG_CONFIG_HOME/nvim/autoload/plug.vim"))
    call plug#begin("$XDG_CONFIG_HOME/nvim/plugged")

    Plug 'airblade/vim-gitgutter'
    Plug 'arcticicestudio/nord-vim'
    Plug 'christoomey/vim-tmux-navigator'
    Plug 'junegunn/fzf.vim'
    Plug 'junegunn/vim-easy-align',
    Plug 'neovim/nvim-lspconfig'
    Plug 'sirver/ultisnips'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-eunuch'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-repeat'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-unimpaired'
    Plug 'tpope/vim-vinegar'

    " try and replace with tree sitter
    Plug 'michaeljsmith/vim-indent-object'
    Plug 'cakebaker/scss-syntax.vim'
    Plug 'jwalton512/vim-blade'
    Plug 'stanangeloff/php.vim'
    Plug 'pangloss/vim-javascript'
    Plug 'posva/vim-vue'
    Plug 'georgewitteman/vim-fish'

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
        \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

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
    highlight VertSplit guibg=none
    highlight Pmenu guibg=none
    highlight StatusLine guibg=none guifg=#e5e9f0
    highlight StatusLineNc guibg=none guifg=#e5e9f0
end

if exists('g:plugs') && has_key(g:plugs, 'nvim-lspconfig')
    lua require 'lsp'
end

if exists('g:plugs') && has_key(g:plugs, 'php.vim')
    let php_var_selector_is_identifier = 1
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

if exists('g:plugs') && has_key(g:plugs, 'vim-javasript')
    let g:javascript_plugin_doc = 1
end
