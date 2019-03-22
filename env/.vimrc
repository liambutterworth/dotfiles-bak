"
" Vim Config
"
" :: Settings
" :: Maps
" :: Theme
" :: Tab Line
" :: Status Line
" :: Text Editing
" :: Language Client
" :: Fuzzy Finder

" :: Settings
" :: Maps
" :: User Interface
" :: Text Editing
" :: Language Client
" :: Fuzzy Finder

"
" Settings
"

execute pathogen#infect()
runtime macros/matchit.vim
filetype plugin indent on
syntax on

set autoindent
set backspace=indent,eol,start
set hidden
set incsearch
set ignorecase smartcase
set lazyredraw
set nobackup
set noswapfile
set splitbelow splitright
set tags=.git/tags
set number relativenumber
set wildmenu wildmode=list:longest,full
set nowrap
set cursorline
set fillchars+=vert:\ 
set laststatus=2
set signcolumn=yes

set expandtab tabstop=4 shiftwidth=4
set list listchars=tab:│\ ,trail:·

autocmd filetype * set formatoptions-=o
autocmd filetype php setlocal commentstring=//%s
autocmd filetype scss.css setlocal commentstring=/*%s*/
autocmd bufread,bufnewfile *.scss,*.css set filetype=scss.css
autocmd bufread,bufnewfile *.blade.php set filetype=blade.html

"
" Maps
"

let mapleader=' '

nmap Y y$
nmap j gj
nmap k gk
nmap U <c-r>

nnoremap + <c-a>
nnoremap - <c-x>
nnoremap <bs> <c-^>
nnoremap <tab> <c-i>
nnoremap <s-tab> <c-o>

inoremap <c-x>, <esc>m`:s/\v(.)$/\=submatch(1)==','?'':submatch(1).','<cr>``a
inoremap <c-x>; <esc>m`:s/\v(.)$/\=submatch(1)==';'?'':submatch(1).';'<cr>``a

nnoremap <leader>n gt
nnoremap <leader>p gT
nnoremap <leader>N :tabm +1<cr>
nnoremap <leader>P :tabm -1<cr>
nnoremap <leader>h <c-w>10<
nnoremap <leader>j <c-w>10-
nnoremap <leader>k <c-w>10+
nnoremap <leader>l <c-w>10>

"
" Theme
"

if !empty(globpath(&runtimepath, '*/nord-vim'))
    colorscheme nord
    let g:nord_comment_brightness=20
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
" Language Client
"

if !empty(globpath(&runtimepath, '*/LanguageClient-neovim'))
    set completefunc=LanguageClient#complete
    set completeopt-=preview

    let g:LanguageClient_serverCommands = {
        \ 'javascript': [ 'typescript-language-server', '--stdio' ],
        \ 'html':       [ 'html-languageserver', '--stdio' ],
        \ 'scss.css':   [ 'css-languageserver', '--stdio' ],
        \ }

    autocmd bufwinenter __LanguageClient__ :setl wrap

    nnoremap <leader>l :call LanguageClient#textDocument_hover()<cr>
    nnoremap <leader>L :pclose<cr>

    imap <c-x>p <esc>:call LanguageClient#textDocument_hover()<cr>a
    imap <c-x>P <esc>:pclose<cr>a
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

    nmap <leader><tab> <plug>(fzf-maps-n)
    xmap <leader><tab> <plug>(fzf-maps-x)
    omap <leader><tab> <plug>(fzf-maps-o)

    imap <c-x><c-k> <plug>(fzf-complete-word)
    imap <c-x><c-f> <plug>(fzf-complete-path)
    imap <c-x><c-j> <plug>(fzf-complete-file-ag)
    imap <c-x><c-l> <plug>(fzf-complete-line)
endif
