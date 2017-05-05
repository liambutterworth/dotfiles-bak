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
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
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
let g:fzf_layout = { 'down': '~40%' }
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
nnoremap <Leader><Leader> :

" navigate wrapped lines
noremap j gj
noremap k gk

" yank to end of line
nnoremap Y y$

" open last file
nnoremap <BS> :e#<CR>

" align commands
nmap ga <Plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)

" toggle commands
nnoremap [h :set nohlsearch<CR>
nnoremap ]h :set hlsearch<CR>
nnoremap [l :set nolist<CR>
nnoremap ]l :set list<CR>

" window resize commands; consistent with tmux
nnoremap <C-w>h <C-w>12<
nnoremap <C-w>j <C-w>8-
nnoremap <C-w>k <C-w>8+
nnoremap <C-w>l <C-w>12>

" fzf completion
imap <C-x><C-k> <Plug>(fzf-complete-word)
imap <C-x><C-f> <Plug>(fzf-complete-path)
imap <C-x><C-j> <Plug>(fzf-complete-file-ag)
imap <C-x><C-l> <Plug>(fzf-complete-line)

" file commands
nnoremap <Leader>w :w<CR>
nnoremap <Leader>W :wq<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>Q :q!<CR>

" git commands
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gl :Glog<CR>
nnoremap <Leader>ga :Gwrite<CR>
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>gb :Gblame<CR>

" sort commands; s for textobj, S for global
nnoremap <Leader>s{ vi{:sort<CR>
nnoremap <Leader>s} m`:g#\({\n\)\@<=#.,/}/sort<CR>:let @/ = ""<CR>``
nnoremap <Leader>s[ vi[:sort<CR>
nnoremap <Leader>s] m`:g#\([\n\)\@<=#.,/]/sort<CR>:let @/ = ""<CR>``
nnoremap <Leader>s( vi(:sort<CR>
nnoremap <Leader>s) m`:g#\((\n\)\@<=#.,/)/sort<CR>:let @/ = ""<CR>``

" append characters to end of line
function! Ender(char)
  s/\v(.)$/\=submatch(1)==a:char ? '' : submatch(1).a:char
endfunction

" append comma
vnoremap ,, :call Ender(',')<CR>
nnoremap ,, m`:call Ender(',')<CR>``
inoremap ,, <Esc>m`:call Ender(',')<CR>``a

" append semicolon
vnoremap ;; :call Ender(';')<CR>
nnoremap ;; m`:call Ender(';')<CR>``
inoremap ;; <Esc>m`:call Ender(';')<CR>``a
