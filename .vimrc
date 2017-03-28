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

" Language

Plug 'hail2u/vim-css3-syntax'
Plug 'tomtom/tcomment_vim'
Plug 'elzr/vim-json'
Plug 'mxw/vim-jsx'

" Completion

Plug 'valloric/youcompleteme'
Plug 'raimondi/delimitmate'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-endwise'
Plug 'sirver/ultisnips'
Plug 'mattn/emmet-vim'

" Code Display

Plug 'pangloss/vim-javascript'
Plug 'yggdroot/indentline'
Plug 'gregsexton/matchtag'

" Integrations

Plug 'scrooloose/syntastic'
Plug 'tpope/vim-vinegar'

" Interface

Plug 'altercation/vim-colors-solarized'
Plug 'vim-airline/vim-airline-themes'
Plug 'bling/vim-airline'
Plug 'kien/ctrlp.vim'

" Commands

Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'

" Other

Plug 'craigemery/vim-autotag'
Plug 'tpope/vim-sensible'
Plug 'godlygeek/tabular'

call plug#end()

"
" Settings
"

colorscheme solarized                            " use the solarized theme
set background=dark                              " use solarized dark and always show status bar
set cursorline                                   " highlight current line
set lazyredraw                                   " buffer screen updates instead of constantly updating
set hlsearch ignorecase                          " search and highlight as you type
set number relativenumber                        " enable line and column count; use both number and relative number to
set splitright splitbelow                        " split right and below by default
set ts=2 sts=2 sw=2 expandtab smarttab           " tab behavior
set nowb nowrap nobackup noswapfile nocompatible " things I don't like

let g:jsx_ext_required=0                                         " use jsx in standard .js files; clean file naming
let g:user_emmet_leader_key='<c-e>'                              " use ctrl x to expand emmet
let g:user_emmet_settings={'javascript.jsx': {'extends': 'jsx'}} " use the javascript.jsx filetype instead of jsx
let g:UltiSnipsExpandTrigger='<c-x>,'                            " use tab to trigger snippets
let g:UltiSnipsJumpForwardTrigger='<c-x>n'                       " move to the next placeholder
let g:UltiSnipsJumpBackwardTrigger='<c-x>N'                      " move to the prev placeholder
let g:delimitMate_expand_cr=2                                    " expand pairs on <cr>
let g:delimitMate_expand_space=1                                 " expand, with padding, on <space>
let g:delimitMate_jump_expansion=1                               " jump expansions when closing delimiter is pressed
let g:ycm_collect_identifiers_from_tags_files=1                  " use ctags for autocompletion
let g:syntastic_check_on_wq=0                                    " why would anyone want to lint a closing file
let g:syntastic_css_checkers=['stylelint']                       " css linting
let g:syntastic_javascript_checkers=['eslint']                   " js linting
let g:ctrlp_custom_ignore='node_modules\|DS_Store\|git'          " ignore in fuzzy finder
let g:ctrlp_match_window='bottom,order:ttb'                      " direction to list from in fuzzy finder
let g:ctrlp_working_path_mode=0                                  " use current vim directory
let g:ctrlp_switch_buffer=0                                      " make fuzzy finder more effecient/faster
let g:ctrlp_show_hidden=1                                        " fuzzy find hidden files
let g:airline_powerline_fonts=1                                  " use the powerline special font characters (chevron stubs); must install on os and select in terminal/gui prefs
let g:autotagTagsFile='.tags'                                    " use a hidden file to store ctags
let g:autotagCtagsCmd='ctags .'                                  " ctag command to run on file save; options stored in ~/.ctags

au BufNewFile,BufRead *.css set syntax=scss " use scss syntax highlighting
au FileType *.md set wrap                   " wrap text in markdown files

"
" Mappings
"

let mapleader=','

function! Ender(char)
  s/\v(.)$/\=submatch(1)==a:char ? '' : submatch(1).a:char
endfunction

nmap _ :Rex<cr>
nmap <leader>s vi{:sort<cr>
nmap <leader>S m`:g#\({\n\)\@<=#.,/}/sort<cr>:let @/ = ""<cr>``
imap <c-e><cr> <cr><esc>O<tab>
nmap <leader>l :set list!<cr>
nmap <leader>h :set hlsearch!<cr>
vmap <leader>; :call Ender(';')<cr>
vmap <leader>, :call Ender(',')<cr>
nmap <leader>; m`:call Ender(';')<cr>``
nmap <leader>, m`:call Ender(',')<cr>``
imap <leader>; <Esc>m`:call Ender(';')<cr>``a
imap <leader>, <Esc>m`:call Ender(',')<cr>``a
nmap <leader>ct :SyntasticToggle<cr>
nmap <leader>cc :SyntasticCheck<cr>
nmap <leader>a" m`:Tab /"<cr>``
imap <leader>a" m`:Tab /"<cr>``
nmap <leader>a= m`:Tab /=<cr>``
vmap <leader>a= m`:Tab /=<cr>``
nmap <leader>a: m`:Tab /:\zs /l0<cr>``
vmap <leader>a: m`:Tab /:\zs /l0<cr>``
