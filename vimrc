"
" Vim Config
"
" :: Settings
" :: Mappings
" :: Plugins

"
" Settings
"

call plug#begin()

Plug 'airblade/vim-gitgutter'
Plug 'andrewradev/splitjoin.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'ludovicchabant/vim-gutentags'
Plug 'raimondi/delimitmate'
Plug 'sheerun/vim-polyglot'
Plug 'suy/vim-context-commentstring'
Plug 'tmhedberg/matchit'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'

call plug#end()

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
set wildmenu wildignorecase wildmode=list:longest,full

if has('persistent_undo')
    silent call system('mkdir -p ~/.vim/undodir')
    set undofile undodir=~/.vim/undodir
endif

augroup Formatting
    autocmd!
    autocmd bufenter * setlocal formatoptions-=o
augroup END

augroup Completion
    autocmd!
    autocmd filetype html setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd filetype css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd filetype javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd filetype php setlocal omnifunc=phpcomplete#CompletePHP
augroup END

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

    if exists('g:loaded_fugitive') && !empty(fugitive#head(7))
        let output .= fugitive#head(7) . ' '
    endif

    return output . '%f%m%r%=%c:%l/%L %{&fenc} %{&ff} '
endfunction

"
" Mappings
"

let mapleader = ' '

nnoremap j gj
nnoremap k gk
nnoremap Y y$
nnoremap U <c-r>
nnoremap <bs> <c-^>
nnoremap g= mmgg=G`m
nnoremap gs :s//g<left><left>
xnoremap gs :s//g<left><left>
xnoremap gr y:%s/<c-r>"//g<left><left>
nnoremap c* *``cgn
nnoremap c# #``cgN
nnoremap d* *``dgn
nnoremap d# #``dgN

nnoremap <leader>w :w<cr>
nnoremap <leader>W :wq<cr>
nnoremap <leader>q :q<cr>
nnoremap <leader>Q :q!<cr>
nnoremap <leader>n :tabn<cr>
nnoremap <leader>p :tabp<cr>
nnoremap <leader>N :tabm +1<cr>
nnoremap <leader>P :tabm -1<cr>
nnoremap <leader>h <c-w>10<
nnoremap <leader>j <c-w>10-
nnoremap <leader>k <c-w>10+
nnoremap <leader>l <c-w>10>

"
" Plugins
"
" :: EasyAlign
" :: DelimitMate
" :: Fugitive
" :: GutenTags
" :: Nord
" :: Polyglot
" :: SplitJoin
" :: FZF

" EasyAlign

xmap ga <plug>(EasyAlign)
nmap ga <plug>(EasyAlign)

" DelimitMate

let g:delimitMate_expand_cr    = 1
let g:delimitMate_expand_space = 1

" Fugitive

nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gb :Gblame<cr>
nnoremap <leader>gd :Gdiff<cr>


" GutenTags

let g:gutentags_ctags_tagfile = '.git/tags'

" Nord

colorscheme nord
let g:nord_uniform_diff_background = 1

" Polyglot

let g:javascript_plugin_jsdoc = 1
let g:jsx_ext_required        = 0

autocmd filetype vue syntax sync fromstart

" SplitJoin

let g:spitjoin_trailing_comma = 1

" FZF

set runtimepath+=~/.zplug/repos/junegunn/fzf

let g:fzf_tags_command        = 'git ctags'
let g:fzf_commits_log_options = '--color=always --format="' . system('echo $GIT_LOG_FORMAT') . '"'

command! -bang -nargs=? -complete=dir Files
            \ call fzf#vim#files(<q-args>, {'options': ['--preview', system('echo $FZF_PREVIEW_OPTS')]}, <bang>0)

nnoremap <leader><space> :Files<cr>
nnoremap <leader><cr> :Buffers<cr>
nnoremap <leader>gf :GFiles?<cr>
nnoremap <leader>gc :Commits<cr>
nnoremap <leader>: :History:<cr>
nnoremap <leader>/ :History/<cr>
nnoremap <leader>` :Marks<cr>
nnoremap <leader>] :Tags<cr>

imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)
