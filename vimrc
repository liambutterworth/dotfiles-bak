"
" Vim Config
"
" :: Settings
" :: Mappings
" :: Plugins

"
" Settings
"

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

call plug#begin()

Plug 'airblade/vim-gitgutter'
Plug 'andrewradev/splitjoin.vim'
Plug 'andrewradev/sideways.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'ludovicchabant/vim-gutentags'
Plug 'mattn/emmet-vim'
Plug 'raimondi/delimitmate'
Plug 'sheerun/vim-polyglot'
Plug 'suy/vim-context-commentstring'
Plug 'tmhedberg/matchit'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'

call plug#end()

" EasyAlign

xmap ga <plug>(EasyAlign)
nmap ga <plug>(EasyAlign)

" SplitJoin

let g:splitjoin_trailing_comma                    = 1
let g:splitjoin_curly_brace_padding               = 1
let g:splitjoin_html_attributes_brack_on_new_line = 1

" Sideways

nnoremap an :SidewaysRight<cr>
nnoremap ap :SidewaysLeft<cr>
nnoremap aw :SidewaysJumpRight<cr>
nnoremap ab :SidewaysJumpLeft<cr>

omap aa <plug>SidewaysArgumentTextobjA
xmap aa <plug>SidewaysArgumentTextobjA
omap ia <plug>SidewaysArgumentTextobjI
xmap ia <plug>SidewaysArgumentTextobjI

" DelimitMate

let g:delimitMate_expand_cr    = 1
let g:delimitMate_expand_space = 1

" Emmet

let g:user_emmet_leader_key = '<c-j>'

" Fugitive

nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gb :Gblame<cr>
nnoremap <leader>gd :Gdiff<cr>

" GitGutter

let g:gitgutter_map_keys = 0

omap ih <plug>GitGutterTextObjectInnerPending
omap ah <plug>GitGutterTextObjectOuterPending
xmap ih <plug>GitGutterTextObjectInnerVisual
xmap ah <plug>GitGutterTextObjectOuterVisual

" GutenTags

let g:gutentags_project_root = [ '.git' ]
let g:gutentags_ctags_tagfile = '.git/tags'

" Nord

colorscheme nord

let g:nord_italic                  = 1
let g:nord_underline               = 1
let g:nord_uniform_diff_background = 1

" Polyglot

let g:javascript_plugin_jsdoc = 1
let g:jsx_ext_required        = 0

autocmd filetype vue syntax sync fromstart

" FZF

set runtimepath+=~/.zplug/repos/junegunn/fzf
let g:fzf_commits_log_options = '--color=always --format="' . system('echo $GIT_LOG_FORMAT') . '"'

command! -bang -nargs=? -complete=dir Files
            \ call fzf#vim#files(<q-args>, {'options': [ '--preview', system('echo $FZF_PREVIEW_OPTS') ]}, <bang>0)

nnoremap <leader><space> :Files<cr>
nnoremap <leader><bs> :Buffers<cr>
nnoremap <leader><cr> :Ag<cr>
nnoremap <leader><tab> :Tags<cr>
nnoremap <leader>gf :GFiles?<cr>
nnoremap <leader>gc :Commits<cr>
nnoremap <leader>G :BLines<cr>
nnoremap <leader>: :History:<cr>
nnoremap <leader>/ :History/<cr>
nnoremap <leader>` :Marks<cr>

imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)
