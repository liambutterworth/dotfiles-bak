"
" Vim Config
"
" :: Settings
" :: Tab Line
" :: Status Line
" :: Commands
" :: Mappings

"
" Settings
"

execute pathogen#infect()
runtime macros/matchit.vim
colorscheme nord
filetype plugin indent on
syntax on

let g:mapleader                               = ' '
let g:ale_sign_warning                        = '▸'
let g:ale_sign_error                          = '▸'
let g:gitgutter_map_keys                      = 0
let g:splitjoin_trailing_comma                = 1
let g:fzf_tags_command                        = 'git ctags'
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_key_list_select_completion          = ['<c-n>']
let g:ycm_key_list_previous_completion        = ['<c-p']
let g:UltiSnipsSnippetDirectories             = [$HOME.'/.vim/snips']

set lazyredraw
set autoindent
set cursorline
set rtp+=~/.fzf
set laststatus=2
set signcolumn=yes
set tags=.git/tags
set fillchars+=vert:\ 
set incsearch ignorecase
set splitright splitbelow
set backspace=indent,eol,start
set ruler number relativenumber
set list listchars=tab:│\ ,trail:·
set wildmenu wildmode=list:longest
set tabstop=4 shiftwidth=4 expandtab
set nowrap novisualbell nobackup noswapfile
set foldenable foldmethod=syntax foldlevelstart=20

"
" Tab Line
"

set tabline=%!TabLine()

function! TabLine()
    let s = ''

    for i in range(tabpagenr('$'))
        if i + 1 == tabpagenr()
            let s .= '%#TabLineSel#'
        else
            let s .= '%#TabLine#'
        endif

        let s .= '%' . (i + 1) . 'T'
        let s .= ' %{TabLabel(' . (i + 1) . ')} '
    endfor

    let s .= '%#TabLineFill#%T'

    return s
endfunction

function TabLabel(n)
    let buflist = tabpagebuflist(a:n)
    let winnr = tabpagewinnr(a:n)
    return bufname(buflist[winnr - 1])
endfunction

"
" Status Line
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
" Commands
"

autocmd CompleteDone * pclose
autocmd filetype * set formatoptions-=o
autocmd filetype scss.css setlocal commentstring=/*%s*/
autocmd bufread,bufnewfile *.css set filetype=scss.css

augroup completion
    autocmd!
    autocmd filetype markdown setlocal spell complete+=kspell
    autocmd filetype html setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd filetype css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd filetype javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd filetype php setlocal omnifunc=phpcomplete#CompletePHP
augroup END

"
" Mappings
"

nmap Y y$
nmap j gj
nmap k gk

nmap <c-w>h <c-w>10<
nmap <c-w>j <c-w>10-
nmap <c-w>k <c-w>10+
nmap <c-w>l <c-w>10>

nmap gP :tabm -1<cr>
nmap gN :tabm +1<cr>
xmap ga <plug>(EasyAlign)
nmap ga <plug>(EasyAlign)

imap <c-x>o <cr><esc>O
imap <c-x><bs> <esc>ddk:s/\s\+$//e<cr>$gJa
imap <c-x>, <esc>m`:s/\v(.)$/\=submatch(1)==','?'':submatch(1).','<cr>``a
imap <c-x>; <esc>m`:s/\v(.)$/\=submatch(1)==';'?'':submatch(1).';'<cr>``a

nmap <leader><space> :Files<cr>
nmap <leader>t :Tags<cr>
nmap <leader>T :BTags<cr>
nmap <leader>h :History<cr>
nmap <leader>a :Ag<cr>
nmap <leader>g :GFiles<cr>
nmap <leader>c :Commits<cr>
nmap <leader>C :BCommits<cr>
