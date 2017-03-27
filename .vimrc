"
" Vim Config
"
" :: Plugins
" :: Settings
" :: Commands
" :: Mappings

"
" Plugins
"

call plug#begin()

" Language

Plug 'mxw/vim-jsx'
Plug 'sukima/xmledit'
Plug 'javascript-indent'
Plug 'hail2u/vim-css3-syntax'

" Completion

Plug 'mattn/emmet-vim'
Plug 'sirver/ultisnips'
Plug 'tpope/vim-endwise'
Plug 'honza/vim-snippets'
Plug 'jiangmiao/auto-pairs'
Plug 'valloric/youcompleteme'

" Code Display

Plug 'yggdroot/indentline'
Plug 'gregsexton/matchtag'
Plug 'pangloss/vim-javascript'

" Integrations

Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-commentary'
Plug 'scrooloose/syntastic'

" Interface

Plug 'kien/ctrlp.vim'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'altercation/vim-colors-solarized'

" Commands

Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'

" Other

Plug 'godlygeek/tabular'
Plug 'craigemery/vim-autotag'

call plug#end()

"
" Settings
"

syntax enable             " enable syntax highlighting
colorscheme solarized     " use the solarized theme
filetype plugin indent on " enable core vim plugins

set cursorline                                                              " highlight current line
set lazyredraw                                                              " buffer screen updates instead of constantly updating
set showcmd showmatch                                                       " show command in status bar and matching braces
set splitright splitbelow                                                   " split right and below by default
set ruler number relativenumber                                             " enable line and column count; use both number and relative number to
set incsearch hlsearch ignorecase                                           " search and highlight as you type
set listchars=tab:‣\ ,eol:¬                                                 " invisible characters to list
set tags=./.tags,.tags;$HOME                                                " use a hidden file to store ctags
set backspace=eol,start,indent                                              " backspace over everything
set background=dark laststatus=2                                            " use solarized dark and always show status bar
set autoindent indentkeys=o,O,<Return>,<>>,!^F                              " indent behavior
set tabstop=2 softtabstop=2 shiftwidth=2 expandtab smarttab                 " tab behavior
set foldenable foldlevelstart=1 foldnestmax=10 foldmethod=indent            " enable code folding
set wildmenu wildmode=list:longest wildignore=log/**/node_modules/**,tmp/** " enable wildmenu
set nowb nowrap nobackup noswapfile novisualbell noerrorbells nocompatible  " things I don't like

let g:jsx_ext_required=0                                " use jsx in standard .js files; clean file naming
let g:xmledit_enable_html=1                             " enable xmledit in html files
let g:user_emmet_leader_key='<c-e>'                     " use ctrl x to expand emmet
let g:user_emmet_next_key='<c-e>j'                      " move to the next placeholder
let g:user_emmet_prev_key='<c-e>k'                      " move to the previous placeholder
let g:UltiSnipsExpandTrigger='<c-x>,'                   " use tab to trigger snippets
let g:UltiSnipsJumpForwardTrigger='<c-x>j'              " move to the next placeholder
let g:UltiSnipsJumpBackwardTrigger='<c-x>k'             " move to the prev placeholder
let g:delimitMate_expand_cr=1                           " expand pairs on <cr>
let g:delimitMate_expand_space=1                        " expand, with padding, on <space>
let g:delimitMate_jump_expansion=1                      " jump expansions when closing delimiter is pressed
let g:ycm_collect_identifiers_from_tags_files=1         " use ctags for autocompletion
let g:syntastic_check_on_wq=0                           " why would anyone want to lint a closing file
let g:syntastic_css_checkers=['stylelint']              " css linting
let g:syntastic_javascript_checkers=['eslint']          " js linting
let g:ctrlp_custom_ignore='node_modules\|DS_Store\|git' " ignore in fuzzy finder
let g:ctrlp_match_window='bottom,order:ttb'             " direction to list from in fuzzy finder
let g:ctrlp_working_path_mode=0                         " use current vim directory
let g:ctrlp_switch_buffer=0                             " make fuzzy finder more effecient/faster
let g:ctrlp_show_hidden=1                               " fuzzy find hidden files
let g:airline_powerline_fonts=1                         " use the powerline special font characters (chevron stubs); must install on os and select in terminal/gui prefs
let g:autotagTagsFile='.tags'                           " use a hidden file to store ctags
let g:autotagCtagsCmd='ctags .'                         " ctag command to run on file save; options stored in ~/.ctags

"
" Commands
"

au BufNewFile,BufRead *.css set syntax=scss              " use scss syntax highlighting
au FileType javascript.jsx setlocal commentstring=//\ %s " use appropriate commenting for javascript.jsx hybrid files

"
" Mappings
"

let mapleader=','

function! Ender(char)
  s/\v(.)$/\=submatch(1)==a:char ? '' : submatch(1).a:char
endfunction

nmap <leader>l :set list!<cr>
nmap <leader>h :set hlsearch!<cr>
vmap <leader>; :call Ender(';')<cr>
vmap <leader>, :call Ender(',')<cr>
nmap <leader>; m`:call Ender(';')<cr>``
nmap <leader>, m`:call Ender(',')<cr>``
imap <leader>; <Esc>m`:call Ender(';')<cr>``a
imap <leader>, <Esc>m`:call Ender(',')<cr>``a
nmap <leader>c :SyntasticToggle<cr>
nmap <leader>a" m`:Tab /"<cr>``
imap <leader>a" m`:Tab /"<cr>``
nmap <leader>a= m`:Tab /=<cr>``
vmap <leader>a= m`:Tab /=<cr>``
nmap <leader>a: m`:Tab /:\zs /l0<cr>``
vmap <leader>a: m`:Tab /:\zs /l0<cr>``
