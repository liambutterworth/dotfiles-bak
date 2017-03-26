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
Plug 'tpope/vim-markdown'
Plug 'hail2u/vim-css3-syntax'

" Completion

Plug 'mattn/emmet-vim'
Plug 'sirver/ultisnips'
Plug 'honza/vim-snippets'
Plug 'raimondi/delimitmate'

" Code Display

Plug 'ap/vim-css-color'
Plug 'ervandew/supertab'
Plug 'gregsexton/matchtag'
Plug 'pangloss/vim-javascript'

" Integrations

Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-commentary'
Plug 'scrooloose/syntastic'
Plug 'marijnh/tern_for_vim'

" Interface

Plug 'kien/ctrlp.vim'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'altercation/vim-colors-solarized'

" Commands

Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-speeddating'

" Other

Plug 'godlygeek/tabular'
Plug 'sickill/vim-pasta'
Plug 'freitass/todo.txt-vim'
Plug 'craigemery/vim-autotag'

call plug#end()

"
" Settings
"

syntax enable                                                               " enable syntax highlighting
filetype plugin indent on                                                   " enable core vim plugins
colorscheme solarized                                                       " use the solarized theme
set background=dark                                                         " use solarized dark
set laststatus=2                                                            " enable airline to show up for a single buffer
set cursorline                                                              " highlight current line
set showcmd                                                                 " show command in status bar as you type
set showmatch                                                               " highlight matching brace
set lazyredraw                                                              " buffer screen updates instead of constantly updating
set ignorecase                                                              " use insensitive search
set incsearch hlsearch                                                      " search and highlight as you type
set splitright splitbelow                                                   " split right and below by default
set ruler number relativenumber                                             " enable line and column count; use both number and relative number to
set listchars=tab:‣\ ,eol:¬                                                 " invisible characters to list
set tags=./.tags,.tags;$HOME                                                " use a hidden file to store ctags
set backspace=eol,start,indent                                              " backspace over everything
set autoindent smartindent indentkeys=o,O,<Return>,<>>,!^F                  " indent behavior
set tabstop=2 softtabstop=2 shiftwidth=2 expandtab smarttab                 " tab behavior
set foldenable foldlevelstart=10 foldnestmax=10 foldmethod=indent           " enable code folding
set wildmenu wildmode=list:longest wildignore=log/**/node_modules/**,tmp/** " enable wildmenu
set nowb nowrap nobackup noswapfile novisualbell noerrorbells nocompatible  " things I don't like

let g:jsx_ext_required=0                                " use jsx in standard .js files; clean file naming
let g:xmledit_enable_html=1                             " use tag completion in html files
let g:UltiSnipsExpandTrigger='<tab>'                    " use tab to trigger snippets
let g:UltiSnipsJumpForwardTrigger='<tab>'               " use standard tabbing behavior
let g:UltiSnipsJumpBackwardTrigger='<s-tab>'            " use standard reverse tabbing behavior
let g:delimitMate_expand_cr=2                           " expand pairs on <cr>
let g:delimitMate_expand_space=1                        " expand, with padding, on <space>
let g:syntastic_check_on_wq=0                           " why would anyone want to lint a closing file
let g:syntastic_css_checkers=['stylelint']              " css linting
let g:syntastic_javascript_checkers=['eslint']          " js linting
let g:airline_powerline_fonts=1                         " use the powerline special font characters (chevron stubs); must install on os and select in terminal/gui prefs
let g:SuperTabContextDefaultCompletionType='<c-n>'      " use standard tabbing behavior
let g:ctrlp_custom_ignore='node_modules\|DS_Store\|git' " ignore in fuzzy finder
let g:ctrlp_match_window='bottom,order:ttb'             " direction to list from in fuzzy finder
let g:ctrlp_working_path_mode=0                         " use current vim directory
let g:ctrlp_switch_buffer=0                             " make fuzzy finder more effecient/faster
let g:ctrlp_show_hidden=1                               " fuzzy find hidden files
let g:autotagTagsFile='.tags'                           " use a hidden file to store ctags
let g:autotagCtagsCmd='ctags .'                         " ctag command to run on file save; options stored in ~/.ctags

"
" Commands
"

au BufNewFile,BufRead *.css set syntax=scss                                       " use scss syntax highlighting
au FileType javascript.jsx setlocal commentstring=//\ %s                          " why do I need this?
au FileType css set omnifunc=csscomplete#CompleteCSS                              " enable omnicomplete for css
au FileType html set omnifunc=htmlcomplete#CompleteTags noci                      " enable omnicomplete for html; noci for xmledit tag completion
au FileType javascript set omnifunc=javascriptcomplete#CompleteJS                 " enable omnicomplete for js
au FileType * if &omnifunc != '' | call SuperTabChain(&omnifunc, '<c-p>') | endif " integrate supertab and omnifunc

"
" Mappings
"

let mapleader=','

function! Ender(char)
  s/\v(.)$/\=submatch(1)==a:char ? '' : submatch(1).a:char
endfunction

nmap <leader>l :set list!<CR>
nmap <leader>h :set hlsearch!<CR>
vmap <leader>; :call Ender(';')<CR>
vmap <leader>, :call Ender(',')<CR>
nmap <leader>; m`:call Ender(';')<CR>``
nmap <leader>, m`:call Ender(',')<CR>``
imap <leader>; <Esc>m`:call Ender(';')<CR>``a
imap <leader>, <Esc>m`:call Ender(',')<CR>``a
nmap <leader>c :SyntasticToggle<CR>
nmap <leader>a= :Tab /=<CR>
nmap <leader>a: :Tab /:\zs /l0<CR>
