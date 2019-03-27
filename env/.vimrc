"
" Vim Config
"
" :: Settings
" :: Commands
" :: Mappings
" :: Functions
" :: Plugins

"
" Settings
"

execute pathogen#infect()
runtime macros/matchit.vim
filetype plugin indent on
let mapleader = ' '
syntax enable

set autoread
set autoindent
set backspace=indent,eol,start
set complete=.,w,b,u,t,k
set dictionary=/usr/share/dict/words
set encoding=utf-8
set fillchars+=vert:\ 
set hidden
set history=1000
set incsearch
set ignorecase smartcase
set laststatus=2
set lazyredraw
set list listchars=tab:│\ ,trail:·
set nobackup noswapfile
set nocursorline
set noerrorbells novisualbell
set nowrap
set number relativenumber
set shiftwidth=4 softtabstop=4 expandtab
set showmatch
set signcolumn=yes
set splitbelow splitright
set statusline=%!StatusLine()
set tabline=%!TabLine()
set tags=.git/tags
set undofile undodir=~/.vim/undodir
set wildmenu wildignorecase wildmode=list:longest,full

"
" Commands
"

augroup FileTypes
    autocmd!
    autocmd bufread,bufnewfile *.scss,*.css setlocal filetype=scss.css
    autocmd bufread,bufnewfile *.blade.php setlocal filetype=blade.html
augroup END

augroup Commenting
    autocmd!
    autocmd filetype * set formatoptions-=o
    autocmd filetype php setlocal commentstring=//%s
    autocmd filetype css setlocal commentstring=/*%s*/
augroup END

augroup Completion
    autocmd!
    autocmd filetype html setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd filetype css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd filetype javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd filetype php setlocal omnifunc=phpcomplete#CompletePHP
augroup END

"
" Mappings
"

nnoremap j gj
nnoremap k gk
nnoremap Y y$
nnoremap U <c-r>
nnoremap <bs> <c-^>
inoremap ,, <esc>mm:call LineEnder(',')<cr>`ma
inoremap ;; <esc>mm:call LineEnder(';')<cr>`ma

nnoremap <leader><space> :
nnoremap <leader>w :w<cr>
nnoremap <leader>W :wq<cr>
nnoremap <leader>q :q<cr>
nnoremap <leader>Q :q!<cr>
nnoremap <leader>n gt
nnoremap <leader>p gT
nnoremap <leader>N :tabm +1<cr>
nnoremap <leader>P :tabm -1<cr>
nnoremap <leader>h <c-w>10<
nnoremap <leader>j <c-w>10-
nnoremap <leader>k <c-w>10+
nnoremap <leader>l <c-w>10>
nnoremap <leader>s :%s//g<left><left>
xnoremap <leader>s :s//g<left><left>
xnoremap <leader>r y:%s/<c-r>"//g<left><left>

"
" Functions
"

function! PluginExists(plugin) abort
    return !empty(globpath(&runtimepath, '*/' . a:plugin))
endfunction

function! LineEnder(char) abort
    s/\v(.)$/\=submatch(1) == a:char ? '' : submatch(1) . a:char
endfunction

function! TabLine() abort
    let output = ''

    for index in range(tabpagenr('$'))
        let tab_index      = index + 1
        let buflist        = tabpagebuflist(tab_index)
        let winnr          = tabpagewinnr(tab_index)
        let tab_name       = fnamemodify(bufname(buflist[winnr - 1]), ':t')
        let tab_highlight  = (tab_index == tabpagenr() ? '%#TabLineSel#' : '%#TabLine#')
        let output        .= tab_highlight . ' ' . tab_name . ' '
    endfor

    return output . '%#TabLineFill#%T'
endfunction

function! StatusLine() abort
    let output = ' '

    if PluginExists('vim-fugitive')
        let output .= fugitive#head(7) . ' '
    endif

    return output . '%f%m%r%=%c:%l/%L %{&fenc} %{&ff}'
endfunction

"
" Plugins
"

if PluginExists('nord-vim')
    colorscheme nord
    let g:nord_comment_brightness = 20
endif

if PluginExists('vim-jsx')
    let g:jsx_ext_required = 0
endif

if PluginExists('vim-javascript')
    let g:javascript_plugin_jsdoc = 1
endif

if PluginExists('delimitmate')
    let g:delimitMate_expand_cr    = 1
    let g:delimitMate_expand_space = 1
endif

if PluginExists('splitjoin.vim')
    let g:spitjoin_trailing_comma = 1
    inoremap <c-j><cr> <space><c-c>diw:SplitjoinSplit<cr>o
    inoremap <c-j><bs> <c-c>ddk:s/\s\+$//e<cr>$:SplitjoinJoin<cr>a
endif

if PluginExists('vim-easy-align')
    xmap <leader>a <plug>(EasyAlign)
    nmap <leader>a <plug>(EasyAlign)
endif

if PluginExists('vim-fugitive')
    nnoremap <leader>gs :Gstatus<cr>
    nnoremap <leader>gd :Gdiff<cr>
endif

if PluginExists('fzf.vim')
    set runtimepath+=~/.fzf
    let g:fzf_commits_log_options=system('echo $GIT_LOG_FORMAT')
    let g:fzf_tags_command='git ctags'

    command! -bang -nargs=? -complete=dir Files
        \ call fzf#vim#files(<q-args>, {'options': ['--preview', system('echo $FZF_PREVIEW_OPTS')]}, <bang>0)

    nnoremap <leader>ff :Files<cr>
    nnoremap <leader>fb :Buffers<cr>
    nnoremap <leader>fh :History<cr>
    nnoremap <leader>f: :History:<cr>
    nnoremap <leader>f/ :History/<cr>
    nnoremap <leader>ft :Tags<cr>
    nnoremap <leader>fc :Commits<cr>
    nnoremap <leader>fl :Lines<cr>

    imap <c-x><c-k> <plug>(fzf-complete-word)
    imap <c-x><c-f> <plug>(fzf-complete-path)
    imap <c-x><c-j> <plug>(fzf-complete-file-ag)
    imap <c-x><c-l> <plug>(fzf-complete-line)
endif

