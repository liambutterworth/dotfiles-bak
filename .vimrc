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
filetype plugin indent on                                                    " init core vim plugins
colorscheme gruvbox                                                          " define colorscheme
syntax enable                                                                " turn on syntax highlighting

set lazyredraw                                                               " make vim more efficient
set autoindent
set formatoptions-=cl " for the love of god don't wrap text
set nowrap novisualbell                                         " things I don't like
set splitright splitbelow                                                    " split right and below by defualt
set laststatus=2 cursorline                                                  " interface settings
set backspace=indent,eol,start                                               " backspace over everything
set ruler number relativenumber                                              " use relative line count
set hlsearch incsearch ignorecase                                            " search settings
set list listchars=tab:▸\ ,trail:·                                           " invisible characters
set wildmenu wildmode=list:longest                                           " wildmenu completion settings
set tags-=.tags tags-=.tags; tags^=.tags;                                    " hidden tag file
set tabstop=2 softtabstop=2 shiftwidth=2 expandtab                           " tab settings
set foldenable foldmethod=syntax foldlevelstart=20                           " sane fold settings
set backupdir=~/.vim/backup// directory=~/.vim/swap//                        " dont clutter the working directory

let g:javascript_plugin_jsdoc = 1                                            " syntax highlighting for JSDoc comments
let g:jsx_ext_required = 0                                                   " use jsx in .js files
let g:gutentags_ctags_tagfile = '.tags'                                      " use a hidden tags file
let g:closetag_filenames = '*.html,*.php,*.js,*.jsx'                         " complete html in these files
let g:gitgutter_sign_column_always = 1                                       " always display sign column; without the text is constantly shifting
let g:ale_statusline_format = [ '⨉ %d', '⚠ %d', '⬥ ok' ]                     " ale format for status line
let g:ale_sign_warning = '▸'                                                 " a better error symbol
let g:ale_sign_error = '▸'                                                   " a better warning symbal; differs from error in color
let g:ctrlp_show_hidden = 1                                                  " show hidden files in ctrlP
let g:ctrlp_match_window = 'bottom,order:ttb'                                " order ctrlP window from top to bottom
let g:ctrlp_custom_ignore = 'node_modules\|git'                              " ignore these folders in ctrlP
let g:airline_powerline_fonts = 1                                            " use powerline fonts for status line
let g:airline_section_error = '%{ALEGetStatusLine()}'                        " add ale output to status line

" format tmux status line
let g:tmuxline_preset = {
  \ 'b':       '#(whoami)@#H',
  \ 'c':       '#S',
  \ 'win':     '#W',
  \ 'cwin':    '#W',
  \ 'y':       '%a %b %d %R %p',
  \ 'options': { 'status-justify': 'left' }
  \ }

" make search consistent with colorscheme
highlight Search ctermbg=0 ctermfg=3 guibg=#282828 guifg=#d79921
highlight IncSearch ctermbg=0 ctermfg=3 guibg=#282828 guifg=#d79921

" make ale signs consistent with colorscheme
highlight ALEErrorSign ctermbg=237 ctermfg=167
highlight ALEWarningSign ctermbg=237 ctermfg=109

" make empty line tildas the same color as background; they annoyed me
highlight NonText ctermfg=0 guifg=#282828

" setup code completion
augroup completion
  autocmd!
  autocmd FileType html setlocal omnifunc=htmlcomplete#CompleteTags            " enable html auto completion
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSs filetype=scss " enable css auto completion
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS  " enable javascript auto completion
  autocmd FileType markdown setlocal spell complete+=kspell                    " use spell checking and enable c-n c-p word completion
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

" open last file
nnoremap <bs> :e#<cr>

" force the use of hjkl
noremap <up> <nop>
noremap <left> <nop>
noremap <down> <nop>
noremap <right> <nop>

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

" fugitive git commands
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gl :Glog<cr>
nnoremap <leader>ga :Gwrite<cr>
nnoremap <leader>gd :Gdiff<cr>
nnoremap <leader>gb :Gblame<cr>

" tabular align commands
" nnoremap <leader>a" m`:Tab /"<cr>``
" vnoremap <leader>a" m`:Tab /"<cr>``
" nnoremap <leader>a= m`:Tab /=<cr>``
" vnoremap <leader>a= m`:Tab /=<cr>``
" nnoremap <leader>a: m`:Tab /:\zs /l0<cr>``
" vnoremap <leader>a: m`:Tab /:\zs /l0<cr>``

" sort alphabetically between {}, [] or (); s for text obj, S for global
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
