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
set backup backupdir=$HOME/.cache/vim/backup//
set complete=.,w,b,u,t,k
set completeopt-=preview
set dictionary=/usr/share/dict/words
set directory=$HOME/.cache/vim/swap//
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
set nojoinspaces
set nowrap
set number relativenumber
set signcolumn=yes
set spelllang=en_us
set splitbelow splitright
set statusline=%!interface#StatusLine()
set tabline=%!interface#TabLine()
set undofile undodir=$HOME/.cache/vim/undo//
set viminfo+=n$HOME/.cache/vim/viminfo
set wildmenu wildignorecase wildmode=full

augroup settings
    autocmd!
    autocmd filetype * setlocal formatoptions-=o
    autocmd bufread,bufnewfile */zsh/* setlocal filetype=zsh
augroup end

augroup preview
    autocmd!
    autocmd WinEnter * if &previewwindow
        \ | setlocal norelativenumber nonumber wrap signcolumn=no
        \ | endif
augroup end

let mapleader = ' '
let g:vim_indent_cont = &shiftwidth
let g:netrw_home = $HOME . '/.cache/vim'

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
nnoremap g; m`:call line#ender(';')<cr>``
nnoremap g, m`:call line#ender(',')<cr>``
nnoremap g' m`:call line#ender("''")<cr>``
vnoremap g; :call line#ender(';')<cr>gv
vnoremap g, :call line#ender(',')<cr>gv
vnoremap g' :call line#ender("'")<cr>gv
inoremap <c-g>; <esc>m`:call line#ender(';')<cr>``a
inoremap <c-g>, <esc>m`:call line#ender(',')<cr>``a
inoremap <c-g>' <esc>m`:call line#ender("''")<cr>``a

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

"
" Plugins
"

if plugin#exists('ale')
    let g:ale_sign_error = '▶'
    let g:ale_sign_warning = '▶'
    let g:ale_php_langserver_use_global = 1
    let g:ale_php_langserver_executable = $HOME . '/.composer/vendor/bin/php-language-server.php'

    let g:ale_linters = {
        \ 'php': ['langserver'],
        \ }

    nnoremap ]a :ALENext<cr>
    nnoremap [a :ALEPrevious<cr>
    nnoremap ]d :ALEGoToDefinition<cr>
    nnoremap ]r :ALEFindREferences<cr>
    nnoremap ]h :ALEHover<cr>
endif

if plugin#exists('delimitmate')
    let g:delimitMate_expand_cr = 1
    let g:delimitMate_expand_space = 1
endif

if plugin#exists('fzf.vim') && command#exists('fzf')
    set runtimepath+=$PLUGINS/fzf

    let s:git_commit_format = '--format="%C(red)%C(bold)%h%d%C(reset) %s %C(blue)%cr"'
    let g:fzf_commits_log_options = '--graph --color=always ' . s:git_commit_format
    let g:fzf_tags_command = 'ctags -R'
    let g:fzf_prefer_tmux = 1

    let g:fzf_action = {
        \ 'ctrl-t': 'tab split',
        \ 'ctrl-s': 'split',
        \ 'ctrl-v': 'vsplit'
        \ }

    command! -bang -nargs=? -complete=dir Files
        \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

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

    imap <c-x><c-k> <plug>(fzf-complete-word)
    imap <c-x><c-j> <plug>(fzf-complete-file)
    imap <c-x><c-f> <plug>(fzf-complete-path)
    imap <c-x><c-l> <plug>(fzf-complete-line)
endif

if plugin#exists('goyo.vim')
    nnoremap <leader>gg :Goyo<cr>
endif

if plugin#exists('vim-gutentags')
    let g:gutentags_enabled = command#exists('ctags')
    let g:gutentags_project_root = ['.git']
    let g:gutentags_ctags_tagfile = '.git/tags'
endif

if plugin#exists('nord-vim')
    let g:nord_italic = 1
    let g:nord_underline = 1
    let g:nord_uniform_diff_background = 1

    colorscheme nord
endif

if plugin#exists('ultisnips')
    let g:UltiSnipsSnippetDirectories = [$HOME . '/.vim/snips']
    let g:UltiSnipsExpandTrigger = '<tab>'
    let g:UltiSnipsJumpForwardTrigger = '<c-j>'
    let g:UltiSnipsJumpBackwardTrigger = '<c-k>'

    nnoremap <leader><s-tab> :UltiSnipsEdit<cr>
    inoremap <c-j> <nop>
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
        \ 'phpVarSelector' : '// %s'
        \ }
endif

if plugin#exists('vim-easy-align')
    xmap ga <plug>(EasyAlign)
    nmap ga <plug>(EasyAlign)
endif

if plugin#exists('vim-gitgutter')
    let g:gitgutter_map_keys = 0

    nnoremap ]h <plug>GitGutterNextHunk
    nnoremap [h <plug>GitGutterPrevHunk

    omap ih <plug>GitGutterTextObjectInnerPending
    omap ah <plug>GitGutterTextObjectOuterPending
    xmap ih <plug>GitGutterTextObjectInnerVisual
    xmap ah <plug>GitGutterTextObjectOuterVisual
endif

if plugin#exists('vim-javascript')
    let g:javascript_plugin_jsdoc = 1
endif

if plugin#exists('vimwiki')
    let g:vimwiki_global_ext = 0

    let g:vimwiki_list = [{
        \ 'path': $HOME . '/Dropbox/Notes',
        \ 'syntax': 'markdown',
        \ 'ext': '.md'
        \ }]
endif
