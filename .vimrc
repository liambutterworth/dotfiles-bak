"
" Vim Config
"
" :: Plugins
" :: Settings
" :: Maps

"
" Plugins
"

call plug#begin()

Plug 'tpope/vim-markdown'
Plug 'nelstrom/vim-markdown-folding'
Plug 'cakebaker/scss-syntax.vim'
Plug 'pangloss/vim-javascript'
Plug 'tomtom/tcomment_vim'
Plug 'elzr/vim-json'
Plug 'mxw/vim-jsx'
Plug 'w0rp/ale'
Plug 'ludovicchabant/vim-gutentags'
Plug 'valloric/youcompleteme', { 'do': './install.py --tern-completer' }
Plug 'jiangmiao/auto-pairs'
Plug 'alvan/vim-closetag'
Plug 'gregsexton/MatchTag', { 'do': 'cd ftplugin && cp xml.vim javascript.vim' }
Plug 'yggdroot/indentline'
Plug 'kien/ctrlp.vim'
Plug 'justinmk/vim-dirvish'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-eunuch'
Plug 'morhetz/gruvbox'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'christoomey/vim-tmux-navigator'
Plug 'edkolev/tmuxline.vim'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'godlygeek/tabular'
Plug 'matchit.zip'

call plug#end()

"
" Settings
"

filetype plugin indent on                                                    " init core vim plugins
colorscheme gruvbox                                                          " define colorscheme
syntax enable                                                                " turn on syntax highlighting

set lazyredraw                                                               " make vim more efficient
set splitright splitbelow                                                    " split right and below by defualt
set laststatus=2 cursorline                                                  " interface settings
set ruler number relativenumber                                              " line and column count; relative for motion
set hlsearch incsearch ignorecase                                            " search settings
set backspace=eol,start,indent                                               " backspace over everything
set list listchars=tab:▸\ ,trail:·                                           " invisible characters
set wildmenu wildmode=list:longest                                           " wildmenu completion settings
set nocompatible nowrap novisualbell                                         " things I don't like
set tags-=.tags tags-=.tags; tags^=.tags;                                    " hidden tag file
set tabstop=2 softtabstop=2 shiftwidth=2 expandtab                           " tab settings
set foldenable foldmethod=syntax foldlevelstart=20                           " sane fold settings
set backupdir=~/.vim/backup// directory=~/.vim/swap//                        " dont clutter the working directory

autocmd BufNewFile,BufRead * setlocal formatoptions-=cl                      " for the love of god dont wrap code
autocmd FileType html setlocal omnifunc=htmlcomplete#CompleteTags            " enable html auto completion
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSs filetype=scss " enable css auto completion
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS  " enable javascript auto completion
autocmd FileType markdown setlocal spell complete+=kspell                    " use spell checking and enable c-n c-p word completion
autocmd FileType dirvish call fugitive#detect(@%)                            " enable fugitive in dirvish file browser

let g:javascript_plugin_jsdoc = 1                                            " syntax highlighting for JSDoc comments
let g:jsx_ext_required = 0                                                   " use jsx in .js files
let g:gutentags_ctags_tagfile = '.tags'                                      " use a hidden tags file
let g:ycm_collect_identifiers_from_tags_files = 1                            " use the tags file for auto completion
let g:ycm_autoclose_preview_window_after_completion = 1                      " close the preview window with popup menu
let g:ycm_key_invoke_completion = 0                                          " reserve <c-space> for tmux
let g:closetag_filenames = '*.html,*.js,*.jsx'                               " complete html in these files
let g:indentLine_char = '│'                                                  " use a longer pipe to create a solid line
let g:indentLine_setConceal = 0                                              " why does indentline even set a conceal
let g:gitgutter_sign_column_always = 1                                       " always display sign column; without the text is constantly shifting
let g:ale_statusline_format = [ '⨉ %d', '⚠ %d', '⬥ ok' ]                     " ale format for status line
let g:ale_sign_warning = '▸'                                                 " a better error symbol
let g:ale_sign_error = '▸'                                                   " a better warning symbal; differs from error in color
let g:dirvish_mode = ':sort r /[^\/]$/'                                      " put folders at the top in file browser
let g:ctrlp_show_hidden = 1                                                  " show hidden files in ctrlP
let g:ctrlp_match_window = 'bottom,order:ttb'                                " order ctrlP window from top to bottom
let g:ctrlp_custom_ignore = 'node_modules|git'                               " ignore these folders in ctrlP
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

"
" Maps
"

" use space bar as leader
let mapleader=' '

" navigate wrapped lines
noremap j gj
noremap k gk

" yank to end of line; consistent with D and C
nnoremap Y y$

" open last edited file
nnoremap <bs> <c-^>

" force the use of hjkl
noremap <up> <nop>
noremap <left> <nop>
noremap <down> <nop>
noremap <right> <nop>

" shortcut for colon command input
nnoremap <leader><leader> :

" window resize commands; consistent with tmux
nnoremap <c-w>h <c-w>5<
nnoremap <c-w>j <c-w>5-
nnoremap <c-w>k <c-w>5+
nnoremap <c-w>l <c-w>5>

" fugitive git commands
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gl :Glog<cr>
nnoremap <leader>ga :Gwrite<cr>
nnoremap <leader>gd :Gdiff<cr>
nnoremap <leader>gb :Gblame<cr>

" tabular align commands
nnoremap <leader>a" m`:Tab /"<cr>``
vnoremap <leader>a" m`:Tab /"<cr>``
nnoremap <leader>a= m`:Tab /=<cr>``
vnoremap <leader>a= m`:Tab /=<cr>``
nnoremap <leader>a: m`:Tab /:\zs /l0<cr>``
vnoremap <leader>a: m`:Tab /:\zs /l0<cr>``

" sort alphabetically between {}, [] or (); s for text obj, S for global
nnoremap <leader>s{ vi{:sort<cr>
nnoremap <leader>s} m`:g#\({\n\)\@<=#.,/}/sort<cr>:let @/ = ""<cr>``
nnoremap <leader>s[ vi[:sort<cr>
nnoremap <leader>s] m`:g#\([\n\)\@<=#.,/]/sort<cr>:let @/ = ""<cr>``
nnoremap <leader>s( vi(:sort<cr>
nnoremap <leader>s) m`:g#\((\n\)\@<=#.,/)/sort<cr>:let @/ = ""<cr>``

" append characters to end of line in any mode
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
