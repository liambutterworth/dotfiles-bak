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

let g:ale_sign_warning                        = '▸'
let g:ale_sign_error                          = '▸'
let g:fzf_tags_command                        = 'git ctags'
let g:gitgutter_map_keys                      = 0
let g:mapleader                               = ' '
let g:splitjoin_trailing_comma                = 1
let g:UltiSnipsSnippetDirectories             = [$HOME.'/.vim/snips']
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_key_list_select_completion          = ['<c-n>']
let g:ycm_key_list_previous_completion        = ['<c-p']

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

"
" TabLine
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

noremap <left> <nop>
noremap <down> <nop>
noremap <up> <nop>
noremap <right> <nop>

nnoremap <c-w>h <c-w>10<
nnoremap <c-w>j <c-w>10-
nnoremap <c-w>k <c-w>10+
nnoremap <c-w>l <c-w>10>

xnoremap ga <plug>(EasyAlign)
nnoremap ga <plug>(EasyAlign)
nnoremap gP :tabm -1<cr>
nnoremap gN :tabm +1<cr>

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
