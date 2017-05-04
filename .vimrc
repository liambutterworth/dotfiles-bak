"
" Vim Config
"
" :: Plugins
" :: Settings
" :: Mappings

"
" Plugins
"

call plug#begin()

Plug 'morhetz/gruvbox'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'w0rp/ale'
Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'edkolev/tmuxline.vim'
Plug 'vim-airline/vim-airline'
Plug 'christoomey/vim-tmux-navigator'
Plug 'ludovicchabant/vim-gutentags'
Plug 'junegunn/vim-easy-align'
Plug 'jiangmiao/auto-pairs'
Plug 'alvan/vim-closetag'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'

call plug#end()

"
" Settings
"

runtime macros/matchit.vim
filetype plugin indent on
colorscheme gruvbox

set lazyredraw
set autoindent
set formatoptions-=cl
set nowrap novisualbell
set splitright splitbelow
set laststatus=2 cursorline
set backspace=indent,eol,start
set ruler number relativenumber
set hlsearch incsearch ignorecase
set list listchars=tab:▸\ ,trail:·
set wildmenu wildmode=list:longest
set tags-=.tags tags-=.tags; tags^=.tags;
set tabstop=2 softtabstop=2 shiftwidth=2 expandtab
set foldenable foldmethod=syntax foldlevelstart=20
set backupdir=~/.vim/backup// directory=~/.vim/swap//

let g:javascript_plugin_jsdoc = 1
let g:jsx_ext_required = 0
let g:gutentags_ctags_tagfile = '.tags'
let g:closetag_filenames = '*.html,*.php,*.js,*.jsx'
let g:gitgutter_sign_column_always = 1
let g:ale_statusline_format = [ '⨉ %d', '⚠ %d', '⬥ ok' ]
let g:ale_sign_warning = '▸'
let g:ale_sign_error = '▸'
let g:ctrlp_show_hidden = 1
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_custom_ignore = 'node_modules\|git'
let g:airline_powerline_fonts = 1
let g:airline_section_error = '%{ALEGetStatusLine()}'

let g:tmuxline_preset = {
  \ 'b':       '#(whoami)@#H',
  \ 'c':       '#S',
  \ 'win':     '#W',
  \ 'cwin':    '#W',
  \ 'y':       '%a %b %d %R %p',
  \ 'options': { 'status-justify': 'left' }
  \ }

highlight Search ctermbg=0 ctermfg=3 guibg=#282828 guifg=#d79921
highlight IncSearch ctermbg=0 ctermfg=3 guibg=#282828 guifg=#d79921
highlight ALEErrorSign ctermbg=237 ctermfg=167
highlight ALEWarningSign ctermbg=237 ctermfg=109
highlight NonText ctermfg=0 guifg=#282828

augroup completion
  autocmd!
  autocmd FileType html setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSs filetype=scss
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType markdown setlocal spell complete+=kspell
augroup END

"
" Mappings
"

" use space bar as leader
let mapleader = ' '

" command shortcut
nnoremap <leader><leader> :

" navigate wrapped lines
noremap j gj
noremap k gk

" yank to end of line
nnoremap Y y$

" align commands
nmap ga <plug>(EasyAlign)
xmap ga <plug>(EasyAlign)

" open last file
nnoremap <bs> :e#<cr>

" toggle commands
nnoremap [h :set nohlsearch<cr>
nnoremap ]h :set hlsearch<cr>
nnoremap [l :set nolist<cr>
nnoremap ]l :set list<cr>

" window resize commands; consistent with tmux
nnoremap <c-w>h <c-w>12<
nnoremap <c-w>j <c-w>8-
nnoremap <c-w>k <c-w>8+
nnoremap <c-w>l <c-w>12>

" file commands
nnoremap <leader>w :w<cr>
nnoremap <leader>W :wq<cr>
nnoremap <leader>q :q<cr>
nnoremap <leader>Q :q!<cr>

" git commands
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gl :Glog<cr>
nnoremap <leader>ga :Gwrite<cr>
nnoremap <leader>gd :Gdiff<cr>
nnoremap <leader>gb :Gblame<cr>

" sort commands; s for textobj, S for global
nnoremap <leader>s{ vi{:sort<cr>
nnoremap <leader>s} m`:g#\({\n\)\@<=#.,/}/sort<cr>:let @/ = ""<cr>``
nnoremap <leader>s[ vi[:sort<cr>
nnoremap <leader>s] m`:g#\([\n\)\@<=#.,/]/sort<cr>:let @/ = ""<cr>``
nnoremap <leader>s( vi(:sort<cr>
nnoremap <leader>s) m`:g#\((\n\)\@<=#.,/)/sort<cr>:let @/ = ""<cr>``

" append characters to end of line
function! Ender(char)
  s/\v(.)$/\=submatch(1)==a:char ? '' : submatch(1).a:char
endfunction

" append comma
vnoremap ,, :call Ender(',')<cr>
nnoremap ,, m`:call Ender(',')<cr>``
inoremap ,, <Esc>m`:call Ender(',')<cr>``a

" append semicolon
vnoremap ;; :call Ender(';')<cr>
nnoremap ;; m`:call Ender(';')<cr>``
inoremap ;; <Esc>m`:call Ender(';')<cr>``a
