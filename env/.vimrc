"
" Vim Config
"
" :: Settings
" :: Commands
" :: Mappings
" :: User Interface
" :: Tab Line
" :: Status Line
" :: Text Editing
" :: Fuzzy Finder

"
" Settings
"

execute pathogen#infect()
runtime macros/matchit.vim
filetype plugin indent on
syntax enable

set autoindent
set hidden
set incsearch
set ignorecase
set lazyredraw
set nobackup
set noerrorbells
set noswapfile
set novisualbell
set smartcase
set tags=.git/tags

"
" Commands
"

augroup FileTypes
    autocmd!
    autocmd bufread,bufnewfile *.scss,*.css set filetype=scss.css
    autocmd bufread,bufnewfile *.blade.php set filetype=blade.html
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

nmap Y y$
nmap j gj
nmap k gk
nmap U <c-r>
nnoremap <bs> <c-^>
nnoremap <leader>n gt
nnoremap <leader>p gT
nnoremap <leader>N :tabm +1<cr>
nnoremap <leader>P :tabm -1<cr>
nnoremap <leader>h <c-w>10<
nnoremap <leader>j <c-w>10-
nnoremap <leader>k <c-w>10+
nnoremap <leader>l <c-w>10>
inoremap <c-x>, <esc>m`:s/\v(.)$/\=submatch(1)==','?'':submatch(1).','<cr>``a
inoremap <c-x>; <esc>m`:s/\v(.)$/\=submatch(1)==';'?'':submatch(1).';'<cr>``a

"
" User Interface
"

set cursorline
set fillchars+=vert:\ 
set list
set listchars=tab:│\ ,trail:·
set laststatus=2
set nowrap
set number
set relativenumber
set signcolumn=yes
set splitbelow
set splitright
set wildmenu
set wildmode=list:longest,full

if !empty(globpath(&runtimepath, '*/nord-vim'))
    colorscheme nord
    let g:nord_comment_brightness=20
endif

if !empty(globpath(&runtimepath, '*/nord-vim'))
    let g:jsx_ext_required=0
endif

"
" Tab Line
"

set tabline=%!TabLine()

function! TabLine()
    let output=''

    for index in range(tabpagenr('$'))
        let output.=(index + 1 == tabpagenr() ? '%#TabLineSel#' : '%#TabLine#')
        let output.='%' . (index + 1) . 'T'
        let output.=' %{TabLabel(' . (index + 1) . ')} '
    endfor

    return output . '%#TabLineFill#%T'
endfunction

function! TabLabel(tab)
    let buflist=tabpagebuflist(a:tab)
    let winnr=tabpagewinnr(a:tab)
    return fnamemodify(bufname(buflist[winnr - 1]), ':r')
endfunction

"
" Status Line
"

set statusline=%#StatusLineText#
set statusline+=\ %{empty(fugitive#head(7))?'':fugitive#head(7).'\ '}%f%M
set statusline+=%=
set statusline+=%{&fileformat}
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\ %l:%c
set statusline+=\ %p%%
set statusline+=\ %#End#

"
" Text Editing
"

set backspace=indent,eol,start
set expandtab
set shiftwidth=4
set softtabstop=4

if !empty(globpath(&runtimepath, '*/delimitmate'))
    let g:delimitMate_expand_cr=1
    let g:delimitMate_expand_space=1
endif

if !empty(globpath(&runtimepath, '*/splitjoin.vim'))
    let g:spitjoin_trailing_comma=1
    inoremap <c-x>o <space><esc>diw:SplitjoinSplit<cr>o
    inoremap <c-x><bs> <esc>ddk:s/\s\+$//e<cr>$:SplitjoinJoin<cr>a
endif

if !empty(globpath(&runtimepath, '*/vim-easy-align'))
    xmap ga <plug>(EasyAlign)
    nmap ga <plug>(EasyAlign)
endif

"
" Fuzzy Finder
"

if !empty(globpath(&runtimepath, '*/fzf.vim'))
    set runtimepath+=~/.fzf

    let g:fzf_commits_log_options='--graph --color=always --format="%C(red)%h%Creset -%C(yellow)%d%Creset %s %C(green)(%cr) %C(blue)<%an>%Creset"'
    let g:fzf_tags_command='git ctags'

    command! -bang -nargs=? -complete=dir Files
        \ call fzf#vim#files(<q-args>, {'options': ['--preview', system('echo $FZF_PREVIEW_OPTS')]}, <bang>0)

    nnoremap <leader>ff :Files<cr>
    nnoremap <leader>fg :GFiles<cr>
    nnoremap <leader>fl :Lines<cr>
    nnoremap <leader>fL :BLines<cr>
    nnoremap <leader>ft :Tags<cr>
    nnoremap <leader>fT :BTags<cr>
    nnoremap <leader>fc :Commits<cr>
    nnoremap <leader>fC :BCommits<cr>
    nnoremap <leader>fh :History<cr>
    nnoremap <leader>f: :History:<cr>
    nnoremap <leader>f/ :History/<cr>

    imap <c-x><c-k> <plug>(fzf-complete-word)
    imap <c-x><c-f> <plug>(fzf-complete-path)
    imap <c-x><c-j> <plug>(fzf-complete-file-ag)
    imap <c-x><c-l> <plug>(fzf-complete-line)
endif
