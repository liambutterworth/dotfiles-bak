"
" Vim Config
"
" :: Settings
" :: TabLine
" :: StatusLine
" :: Mappings

"
" Settings
"

execute pathogen#infect()
runtime macros/matchit.vim
colorscheme nord
filetype plugin indent on
syntax on

set autoindent
set backspace=indent,eol,start
set cursorline
set fillchars+=vert:\ 
set incsearch ignorecase
set foldenable foldmethod=syntax foldlevelstart=20
set laststatus=2
set lazyredraw
set list listchars=tab:│\ ,trail:·
set nowrap novisualbell nobackup noswapfile
set signcolumn=yes
set splitright splitbelow
set tabstop=4 shiftwidth=4 expandtab
set tags=.git/tags
set rtp+=~/.fzf
set ruler number relativenumber
set wildmenu wildmode=list:longest

autocmd filetype * set formatoptions-=o
autocmd filetype scss.css setlocal commentstring=/*%s*/
autocmd filetype php setlocal commentstring=//%s
autocmd bufread,bufnewfile *.css set filetype=scss.css

let g:ale_sign_warning                        = '▸'
let g:ale_sign_error                          = '▸'
let g:fzf_tags_command                        = 'git ctags'
let g:gitgutter_map_keys                      = 0
let g:mapleader                               = ' '
let g:nord_comment_brightness                 = 20
let g:splitjoin_trailing_comma                = 1
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_key_list_select_completion          = ['<c-n>']
let g:ycm_key_list_previous_completion        = ['<c-p']

let g:LanguageClient_serverCommands = {
    \ 'javascript': [ 'typescript-language-server', '--stdio' ]
    \ }

"
" TabLine
"

set tabline=%!TabLine()

function! TabLine()
    let output = ''

    for index in range(tabpagenr('$'))
        let output .= (index + 1 == tabpagenr() ? '%#TabLineSel#' : '%#TabLine#')
        let output .= '%' . (index + 1) . 'T'
        let output .= ' %{TabLabel(' . (index + 1) . ')} '
    endfor

    return output . '%#TabLineFill#%T'
endfunction

function TabLabel(tab)
    let buflist = tabpagebuflist(a:tab)
    let winnr   = tabpagewinnr(a:tab)

    return fnamemodify(bufname(buflist[winnr - 1]), ':r')
endfunction

"
" StatusLine
"

set statusline  =%#StatusLineText#
set statusline +=\ %{empty(fugitive#head(7))?'':fugitive#head(7).'\ '}%f%M
set statusline +=%=
set statusline +=%{&fileformat}
set statusline +=\ %{&fileencoding?&fileencoding:&encoding}
set statusline +=\ %l:%c
set statusline +=\ %p%%
set statusline +=\ %#End#

"
" Mappings
"

nmap Y y$
nmap j gj
nmap k gk

nnoremap <c-w>h <c-w>10<
nnoremap <c-w>j <c-w>10-
nnoremap <c-w>k <c-w>10+
nnoremap <c-w>l <c-w>10>

xmap ga <plug>(EasyAlign)
nmap ga <plug>(EasyAlign)
nmap gP :tabm -1<cr>
nmap gN :tabm +1<cr>

inoremap <c-x>o <cr><esc>O
inoremap <c-x><bs> <esc>ddk:s/\s\+$//e<cr>$gJa
inoremap <c-x>, <esc>m`:s/\v(.)$/\=submatch(1)==','?'':submatch(1).','<cr>``a
inoremap <c-x>; <esc>m`:s/\v(.)$/\=submatch(1)==';'?'':submatch(1).';'<cr>``a

nnoremap <leader><space> :Files<cr>
nnoremap <leader>t :Tags<cr>
nnoremap <leader>T :BTags<cr>
nnoremap <leader>h :History<cr>
nnoremap <leader>a :Ag<cr>
nnoremap <leader>g :GFiles<cr>
nnoremap <leader>c :Commits<cr>
nnoremap <leader>C :BCommits<cr>

imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)
