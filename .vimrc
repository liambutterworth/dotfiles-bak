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
Plug 'cakebaker/scss-syntax.vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'w0rp/ale'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'christoomey/vim-tmux-navigator'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'jiangmiao/auto-pairs'
Plug 'alvan/vim-closetag'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'

call plug#end()

"
" Settings
"

silent! colorscheme gruvbox
filetype plugin indent on
runtime macros/matchit.vim
scriptencoding utf-8

let g:jsx_ext_required        = 0
let g:javascript_plugin_jsdoc = 1
let g:closetag_filenames      = '*.html,*.php,*.js,*.jsx'
let g:gitgutter_map_keys      = 0
let g:ale_sign_warning        = '>'
let g:ale_sign_error          = '>'

set encoding=utf-8
set background=dark
set autoindent
set cursorline
set laststatus=2
set tags=./.tags;
set signcolumn=yes
set splitright splitbelow
set backspace=indent,eol,start
set ruler number relativenumber
set hlsearch incsearch ignorecase
set list listchars=tab:\|\ ,trail:.
set wildmenu wildmode=list:longest
set tabstop=2 shiftwidth=2 noexpandtab
set nowrap novisualbell nobackup noswapfile
set foldenable foldmethod=syntax foldlevelstart=20

function! GitBranch()
	let l:branch = system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
	return empty(branch) ? '' : branch . ' '
endfunction

function! AleStatus(type) abort
	let l:counts         = ale#statusline#Count(bufnr(''))
	let l:all_errors     = l:counts.error + l:counts.style_error
	let l:all_non_errors = l:counts.total - l:all_errors

	if a:type == 'errors'
		return all_errors > 0 ? printf('%d', all_errors) : ''
	elseif a:type == 'warnings'
		return all_non_errors > 0 ? printf('%d', all_non_errors) : ''
	else
		return printf('%de%dw', all_errors, all_non_errors)
	endif
endfunction

set statusline =
set statusline +=%#GruvboxFg4#
set statusline +=\ %{GitBranch()}%f%M
set statusline +=%#GruvboxRed#
set statusline +=\ %{AleStatus('errors')}
set statusline +=%#GruvboxBlue#
set statusline +=\ %{AleStatus('warnings')}
set statusline +=%=
set statusline +=%#GruvboxFg4#
set statusline +=\ %{&fileformat}
set statusline +=\ %{&fileencoding?&fileencoding:&encoding}
set statusline +=\ %l:%c
set statusline +=\ %p%%
set statusline +=\ %#END#

highlight clear SignColumn
highlight search ctermbg=0 ctermfg=3 guibg=#282828 guifg=#d79921
highlight incsearch ctermbg=0 ctermfg=3 guibg=#282828 guifg=#d79921
highlight aleerrorsign ctermbg=235 ctermfg=167
highlight alewarningsign ctermbg=235 ctermfg=109
highlight nontext ctermfg=0 guifg=#282828

autocmd CompleteDone * pclose
autocmd filetype * set formatoptions-=o
autocmd filetype scss.css setlocal commentstring=/*%s*/
autocmd bufread,bufnewfile *.css set filetype=scss.css
autocmd bufread,bufnewfile .tmuxrc set filetype=tmux

augroup completion
  autocmd!
  autocmd filetype markdown setlocal spell complete+=kspell
  autocmd filetype html setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd filetype css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd filetype javascript setlocal omnifunc=javascriptcomplete#CompleteJS
augroup END

"
" Mappings
"
" :: General
" :: Leader
" :: FZF
" :: Git
" :: Toggle
" :: Ender

" General

noremap j gj
noremap k gk

nnoremap Y y$

nnoremap <bs> :e#<cr>

nnoremap <c-w>h <c-w>12<
nnoremap <c-w>j <c-w>8-
nnoremap <c-w>k <c-w>8+
nnoremap <c-w>l <c-w>12>

xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" Leader

let mapleader = ' '

nnoremap <leader>o m`o<esc>``
nnoremap <leader>O m`O<esc>``

nnoremap <leader>w :w<cr>
nnoremap <leader>W :wq<cr>
nnoremap <leader>q :q<cr>
nnoremap <leader>Q :q!<cr>

" FZF

nnoremap <leader><leader> :Files<cr>

imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

" Git

nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gl :Glog<cr>
nnoremap <leader>ga :Gwrite<cr>
nnoremap <leader>gd :Gdiff<cr>
nnoremap <leader>gb :Gblame<cr>
nnoremap <leader>gn <plug>GitGutterNextHunk
nnoremap <leader>gp <plug>GitGutterPrevHunk

" Toggle

nnoremap [h :set nohlsearch<cr>
nnoremap ]h :set hlsearch<cr>
nnoremap [l :set nolist<cr>
nnoremap ]l :set list<cr>
nnoremap [a :ALEDisable<cr>
nnoremap ]a :ALEEnable<cr>

" Ender

function! Ender(char)
  s/\v(.)$/\=submatch(1)==a:char ? '' : submatch(1).a:char
endfunction

vnoremap ,, :call Ender(',')<cr>
nnoremap ,, m`:call Ender(',')<cr>``
inoremap ,, <esc>m`:call Ender(',')<cr>``a

vnoremap ;; :call Ender(';')<cr>
nnoremap ;; m`:call Ender(';')<cr>``
inoremap ;; <esc>m`:call Ender(';')<cr>``a
