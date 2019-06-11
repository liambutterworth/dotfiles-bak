"
" Vim Config
"
" :: Settings
" :: Mappings
" :: Plugins

"
" Settings
"

execute pathogen#infect($HOME . '/.vim/plugins/{}')
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
set splitbelow splitright
set statusline=%!functions#StatusLine()
set tabline=%!functions#TabLine()
set undofile undodir=$HOME/.cache/vim/undo//
set viminfo+=n$HOME/.cache/vim/viminfo
set wildmenu wildignorecase wildmode=full

augroup settings
    autocmd!
    autocmd filetype * set formatoptions-=o
    autocmd bufread,bufnewfile */zsh/functions/* set syntax=zsh
augroup end

let mapleader = ' '
let g:vim_indent_cont = &shiftwidth
let g:netrw_home = $HOME . '/.cache/vim'
let g:netrw_fastbrowse = 0

"
" Mappings
"

nnoremap j gj
nnoremap k gk
nnoremap Y y$
nnoremap <bs> <c-^>
nnoremap g= mmgg=G`m
nnoremap c* *``cgn
nnoremap c# #``cgN
nnoremap d* *``dgn
nnoremap d# #``dgN

nnoremap <leader>r :source ~/.vimrc<cr>
nnoremap <leader>x :close<cr>
nnoremap <leader>c :tabe %<cr>
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

nnoremap ]<space> o<esc>'[k
nnoremap [<space> O<esc>j
nnoremap <silent><expr> ]e ':<c-u>m+' . v:count1 . '<cr>=='
nnoremap <silent><expr> [e ':<c-u>m-' . (v:count1 + 1) . '<cr>=='
vnoremap <silent><expr> ]e ":<c-u>'<,'>m'>+" . v:count1 . '<cr>gv=gv'
vnoremap <silent><expr> [e ":<c-u>'<,'>m-" . (v:count1 + 1) . '<cr>gv=gv'
vnoremap ;; :s/\v(.)$/\=submatch(1) == ';' ? '' : submatch(1) . ';'<cr>
vnoremap ,, :s/\v(.)$/\=submatch(1) == ',' ? '' : submatch(1) . ','<cr>
inoremap ;; <esc>m`:s/\v(.)$/\=submatch(1) == ';' ? '' : submatch(1) . ';'<cr>``a
inoremap ,, <esc>m`:s/\v(.)$/\=submatch(1) == ',' ? '' : submatch(1) . ','<cr>``a

"
" Plugins
"

if functions#PluginExists('delimitmate')
    let g:delimitMate_expand_cr = 1
    let g:delimitMate_expand_space = 1
endif

if functions#PluginExists('fzf.vim') && functions#CommandExists('fzf')
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
    nnoremap <leader>? :GFiles?<cr>
    nnoremap <leader>] :Tags<cr>
    nnoremap <leader>` :Marks<cr>
    nnoremap <leader>G :Lines<cr>

    imap <c-x><c-k> <plug>(fzf-complete-word)
    imap <c-x><c-j> <plug>(fzf-complete-file)
    imap <c-x><c-f> <plug>(fzf-complete-path)
    imap <c-x><c-l> <plug>(fzf-complete-line)
endif

if functions#PluginExists('gutentags')
    let g:gutentags_enabled = functions#CommandExists('ctags')
    let g:gutentags_project_root = ['.git']
    let g:gutentags_ctags_tagfile = '.git/tags'
endif

if functions#PluginExists('indentline')
    let g:indentLine_char = '│'
    let g:indentLine_color_term = 0
endif

if functions#PluginExists('nord-vim')
    let g:nord_italic = 1
    let g:nord_underline = 1
    let g:nord_uniform_diff_background = 1

    colorscheme nord
endif

if functions#PluginExists('ultisnips')
    let g:UltiSnipsSnippetDirectories = [$HOME . '/.vim/snips']
    let g:UltiSnipsExpandTrigger = '<tab>'
    let g:UltiSnipsJumpForwardTrigger = '<c-j>'
    let g:UltiSnipsJumpBackwardTrigger = '<c-k>'

    nnoremap <leader><s-tab> :UltiSnipsEdit<cr>
    inoremap <c-j> <nop>
endif

if functions#PluginExists('vim-easy-align')
    xmap ga <plug>(EasyAlign)
    nmap ga <plug>(EasyAlign)
endif

if functions#PluginExists('vim-gitgutter')
    let g:gitgutter_map_keys = 0

    nnoremap ]h <plug>GitGutterNextHunk
    nnoremap [h <plug>GitGutterPrevHunk

    omap ih <plug>GitGutterTextObjectInnerPending
    omap ah <plug>GitGutterTextObjectOuterPending
    xmap ih <plug>GitGutterTextObjectInnerVisual
    xmap ah <plug>GitGutterTextObjectOuterVisual
endif

if functions#PluginExists('vim-javascript')
    let g:javascript_plugin_jsdoc = 1
endif
