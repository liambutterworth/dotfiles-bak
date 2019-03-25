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
syntax enable

set autoindent
set backspace=indent,eol,start
set cursorline
set expandtab shiftwidth=4 softtabstop=4
set encoding=utf-8
set fillchars+=vert:\ 
set foldmethod=indent foldlevel=2
set hidden
set history=1000
set incsearch
set ignorecase smartcase
set laststatus=2
set lazyredraw
set list listchars=tab:│\ ,trail:·
set nobackup noswapfile
set noerrorbells novisualbell
set nowrap
set number relativenumber
set signcolumn=yes
set splitbelow splitright
set statusline=%!StatusLine()
set tabline=%!TabLine()
set tags=.git/tags
set wildmenu wildmode=list:longest,full

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

"
" Mappings
"

let mapleader=' '

nmap j gj
nmap k gk
nmap Y y$
nmap U <c-r>
nmap <bs> <c-^>

inoremap <c-x>, <c-c>m`:s/\v(.)$/\=submatch(1)==','?'':submatch(1).','<cr>``a
inoremap <c-x>; <c-c>m`:s/\v(.)$/\=submatch(1)==';'?'':submatch(1).';'<cr>``a

nnoremap <leader>w :w<cr>
nnoremap <leader>W :w!<cr>
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

"
" Functions
"

function! TabLine() abort
    let output=''

    for index in range(tabpagenr('$'))
        let output.=(index + 1 == tabpagenr() ? '%#TabLineSel#' : '%#TabLine#')
        let output.='%' . (index + 1) . 'T'
        let output.=' %{TabLabel(' . (index + 1) . ')} '
    endfor

    return output . '%#TabLineFill#%T'
endfunction

function! TabLabel(tab) abort
    let buflist=tabpagebuflist(a:tab)
    let winnr=tabpagewinnr(a:tab)
    return fnamemodify(bufname(buflist[winnr - 1]), ':r')
endfunction

function! StatusLine() abort
    let output=' '

    if !empty(globpath(&runtimepath, '*/vim-fugitive'))
        let output .= fugitive#head(7) . ' '
    endif

    let output .= '%f%m%r%='
    let output .= '%c:%l/%L '
    let output .= '%{&fileencoding} '
    let output .= '%{&fileformat} '

    return output . ' '
endfunction

"
" Plugins
"

if !empty(globpath(&runtimepath, '*/nord-vim'))
    colorscheme nord
    let g:nord_comment_brightness=20
endif

if !empty(globpath(&runtimepath, '*/vim-jsx'))
    let g:jsx_ext_required=0
endif

if !empty(globpath(&runtimepath, '*/delimitmate'))
    let g:delimitMate_expand_cr=1
    let g:delimitMate_expand_space=1
endif

if !empty(globpath(&runtimepath, '*/splitjoin.vim'))
    let g:spitjoin_trailing_comma=1
    inoremap <c-x>o <space><c-c>diw:SplitjoinSplit<cr>o
    inoremap <c-x><bs> <c-c>ddk:s/\s\+$//e<cr>$:SplitjoinJoin<cr>a
endif

if !empty(globpath(&runtimepath, '*/vim-easy-align'))
    xmap ga <plug>(EasyAlign)
    nmap ga <plug>(EasyAlign)
endif

if !empty(globpath(&runtimepath, '*/fzf.vim'))
    set runtimepath+=~/.fzf

    let g:fzf_commits_log_options='--graph --color=always --format="%C(red)%h%Creset -%C(yellow)%d%Creset %s %C(green)(%cr) %C(blue)<%an>%Creset"'
    let g:fzf_tags_command='git ctags'

    command! -bang -nargs=? -complete=dir Files call fzf#vim#files(<q-args>, {'options': ['--preview', system('echo $FZF_PREVIEW_OPTS')]}, <bang>0)

    nnoremap <leader>ff :Files<cr>
    nnoremap <leader>fg :GFiles<cr>
    nnoremap <leader>fw :Windows<cr>
    nnoremap <leader>fb :Buffers<cr>
    nnoremap <leader>fm :Marks<cr>
    nnoremap <leader>fh :History<cr>
    nnoremap <leader>f: :History:<cr>
    nnoremap <leader>f/ :History/<cr>
    nnoremap <leader>ft :Tags<cr>
    nnoremap <leader>fT :BTags<cr>
    nnoremap <leader>fc :Commits<cr>
    nnoremap <leader>fC :BCommits<cr>
    nnoremap <leader>fl :Linnes<cr>
    nnoremap <leader>fL :BLines<cr>

    imap <c-x><c-k> <plug>(fzf-complete-word)
    imap <c-x><c-f> <plug>(fzf-complete-path)
    imap <c-x><c-j> <plug>(fzf-complete-file-ag)
    imap <c-x><c-l> <plug>(fzf-complete-line)
endif
