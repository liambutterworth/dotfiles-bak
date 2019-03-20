"
" Vim Config
"
" :: Settings
" :: Mappings
" :: Status Line
" :: Tab Line
" :: Theme
" :: Easy Align
" :: Split Join
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
set cursorline
set fillchars+=vert:\ 
set hidden
set ignorecase
set incsearch
set laststatus=2
set lazyredraw
set list listchars=tab:│\ ,trail:·
set nobackup
set noswapfile
set nowrap
set splitbelow splitright
set tabstop=4 shiftwidth=4 expandtab
set tags=.git/tags
set number relativenumber
set signcolumn=yes
set wildmenu wildmode=list:longest,full

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

nmap gP :tabm -1<cr>
nmap gN :tabm +1<cr>

nnoremap <c-w>h <c-w>10<
nnoremap <c-w>j <c-w>10-
nnoremap <c-w>k <c-w>10+
nnoremap <c-w>l <c-w>10>

inoremap <c-x>o <cr><esc>O
inoremap <c-x><bs> <esc>ddk:s/\s\+$//e<cr>$gJi
inoremap <c-x>, <esc>m`:s/\v(.)$/\=submatch(1)==','?'':submatch(1).','<cr>``a
inoremap <c-x>; <esc>m`:s/\v(.)$/\=submatch(1)==';'?'':submatch(1).';'<cr>``a

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
" Theme
"

if !empty(globpath(&runtimepath, '*/nord-vim'))
    colorscheme nord
    let g:nord_comment_brightness=20
endif

"
" Easy Align
"

if !empty(globpath(&runtimepath, '*/vim-easy-align'))
    xmap ga <plug>(EasyAlign)
    nmap ga <plug>(EasyAlign)
endif

"
" Split Join
"

if !empty(globpath(&runtimepath, '*/split-join.vim'))
    set g:splitjoin_trailing_comma=1
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

    nnoremap <leader>p :call LanguageClient#textDocument_hover()<cr>
    nnoremap <leader>P :pclose<cr>

    imap <c-x>p <esc>:call LanguageClient#textDocument_hover()<cr>a
    imap <c-x>P <esc>:pclose<cr>a
endif

"
" Fuzzy Finder
"

if !empty(globpath(&runtimepath, '*/fzf.vim'))
    set runtimepath+=~/.fzf

    let g:fzf_commits_log_options = '--graph --color=always --format="%C(red)%h%Creset -%C(yellow)%d%Creset %s %C(green)(%cr) %C(blue)<%an>%Creset"'
    let g:fzf_tags_command='git ctags'

    command! -bang -nargs=? -complete=dir Files
        \ call fzf#vim#files(<q-args>, {'options': ['--preview', system('echo $FZF_PREVIEW_OPTS')]}, <bang>0)

    nnoremap <leader><space> :Files<cr>
    nnoremap <leader>g :GFiles<cr>
    nnoremap <leader>l :Lines<cr>
    nnoremap <leader>L :BLines<cr>
    nnoremap <leader>t :Tags<cr>
    nnoremap <leader>T :BTags<cr>
    nnoremap <leader>c :Commits<cr>
    nnoremap <leader>C :BCommits<cr>
    nnoremap <leader>h :History<cr>
    nnoremap <leader>: :History:<cr>
    nnoremap <leader>/ :History/<cr>

    nmap <leader><tab> <plug>(fzf-maps-n)
    xmap <leader><tab> <plug>(fzf-maps-x)
    omap <leader><tab> <plug>(fzf-maps-o)

    imap <c-x><c-k> <plug>(fzf-complete-word)
    imap <c-x><c-f> <plug>(fzf-complete-path)
    imap <c-x><c-j> <plug>(fzf-complete-file-ag)
    imap <c-x><c-l> <plug>(fzf-complete-line)
endif
