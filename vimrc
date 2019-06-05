"
" Vim Config
"
" :: Settings
" :: Commands
" :: Functions
" :: Mappings
" :: Plugins

"
" Settings
"

let $CACHE = $HOME . '/.cache/vim'
let $DOTFILES = $HOME . '/.dotfiles'
let $PLUGS = $DOTFILES . '/plugs/vim'
let $SNIPS = $DOTFILES . '/snips'

execute pathogen#infect($PLUGS . '/{}')
filetype plugin indent on
syntax enable

set autoread
set autoindent
set backup backupdir=$CACHE/backup//
set backspace=indent,eol,start
set complete=.,w,b,u,t,k
set completeopt-=preview
set dictionary=/usr/share/dict/words
set directory=$CACHE/swap//
set encoding=utf-8
set expandtab shiftwidth=4 softtabstop=4
set fillchars+=vert:\ 
set foldenable foldmethod=indent foldlevelstart=99
set hidden
set incsearch
set ignorecase smartcase
set laststatus=2
set lazyredraw
set list listchars=tab:│\ ,trail:·
set nojoinspaces
set nowrap
set number relativenumber
set signcolumn=yes
set splitbelow splitright
set statusline=%!StatusLine()
set tabline=%!TabLine()
set undofile undodir=$CACHE/undo//
set viminfo+=n$CACHE/viminfo
set wildmenu wildignorecase wildmode=full

let mapleader = ' '
let g:vim_indent_cont = &shiftwidth
let g:netrw_home = $CACHE
let g:netrw_fastbrowse = 0

"
" Commands
"

augroup Format
    autocmd!
    autocmd bufenter * setlocal formatoptions-=o
    autocmd filetype text,markdown setlocal wrap linebreak
augroup END

augroup Indent
    autocmd!
    autocmd filetype yaml setlocal shiftwidth=2 softtabstop=2
augroup END

augroup Complete
    autocmd!
    autocmd filetype html setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd filetype css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd filetype javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd filetype php setlocal omnifunc=phpcomplete#CompletePHP
augroup END

"
" Functions
"

let s:git_branch = substitute(system(
    \ 'git rev-parse --git-dir >/dev/null 2>&1 && git rev-parse --abbrev-ref HEAD'
    \ ), '\n', '', 'g')

let s:file_permissions = substitute(system(
    \ 'ls -la ' . expand('%:h') .
    \ ' | grep ' . expand('%:t') .
    \ ' | cut -d " " -f1'
    \ ), '\n', '', 'g')

function! StatusLine() abort
    let output = ' '

    let output .= '%f%m'
    let output .= !empty(s:git_branch) ? ' ' . s:git_branch : ''
    let output .= '%=%c:%l/%L %{&fileformat}'
    let output .= filereadable(expand('%:p')) ? ' %{&fileencoding}' : ''
    let output .= !empty(s:file_permissions) ? ' ' . s:file_permissions : ''

    return output . ' '
endfunction

function! TabLine() abort
    let output = ''

    for index in range(tabpagenr('$'))
        let tab_index = index + 1
        let buflist = tabpagebuflist(tab_index)
        let winnr = tabpagewinnr(tab_index)
        let tab_name = fnamemodify(bufname(buflist[winnr - 1]), ':t')
        let tab_highlight = (tab_index == tabpagenr() ? '%#TabLineSel#' : '%#TabLine#')

        let output .= tab_highlight . ' ' . tab_name . ' '
    endfor

    return output . '%#TabLineFill#%T'
endfunction

function! PlugExists(plugin) abort
    return !empty(globpath(&runtimepath, '*/' . a:plugin))
endfunction

function! CommandExists(command) abort
    return !empty(system('command -v ' . a:command))
endfunction

"
" Mappings
"

nnoremap j gj
nnoremap k gk
nnoremap Y y$
nnoremap <bs> <c-^>
nnoremap g= mmgg=G`m
nnoremap c* *``cgn
nnoremap c# #``cgN
nnoremap d* *``dgn
nnoremap d# #``dgN

nnoremap <leader>r :source ~/.vimrc<cr>
nnoremap <leader>x :close<cr>
nnoremap <leader>c :tabe %<cr>
nnoremap <leader>s :split<cr>
nnoremap <leader>v :vsplit<cr>
nnoremap <leader>p :tabp<cr>
nnoremap <leader>n :tabn<cr>
nnoremap <leader>P :tabm -1<cr>
nnoremap <leader>N :tabm +1<cr>
nnoremap <leader>h <c-w>10<
nnoremap <leader>j <c-w>10-
nnoremap <leader>k <c-w>10+
nnoremap <leader>l <c-w>10>

nnoremap ]<space> o<esc>'[k
nnoremap [<space> O<esc>j
nnoremap <silent><expr> ]e ':<c-u>m+' . v:count1 . '<cr>=='
nnoremap <silent><expr> [e ':<c-u>m-' . (v:count1 + 1) . '<cr>=='
vnoremap <silent><expr> ]e ":<c-u>'<,'>m'>+" . v:count1 . '<cr>gv=gv'
vnoremap <silent><expr> [e ":<c-u>'<,'>m-" . (v:count1 + 1) . '<cr>gv=gv'
vnoremap ;; :s/\v(.)$/\=submatch(1) == ';' ? '' : submatch(1) . ';'<cr>
vnoremap ,, :s/\v(.)$/\=submatch(1) == ',' ? '' : submatch(1) . ','<cr>
inoremap ;; <esc>m`:s/\v(.)$/\=submatch(1) == ';' ? '' : submatch(1) . ';'<cr>``a
inoremap ,, <esc>m`:s/\v(.)$/\=submatch(1) == ',' ? '' : submatch(1) . ','<cr>``a

"
" Plugins
"

if PlugExists('delimitmate')
    let g:delimitMate_expand_cr = 1
    let g:delimitMate_expand_space = 1
endif

if PlugExists('fzf.vim') && CommandExists('fzf')
    set runtimepath+=$DOTFILES/plugs/zsh/fzf

    let git_commit_format = '--format="%C(red)%C(bold)%h%d%C(reset) %s %C(blue)%cr"'
    let g:fzf_commits_log_options = '--graph --color=always ' . git_commit_format
    let g:fzf_tags_command = 'ctags -R'

    command! -bang -nargs=? -complete=dir Files
        \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

    nnoremap <leader><space> :Files<cr>
    nnoremap <leader><tab> :Snippets<cr>
    nnoremap <leader><bs> :Buffers<cr>
    nnoremap <leader><cr> :Commits<cr>
    nnoremap <leader>? :GFiles?<cr>
    nnoremap <leader>: :History:<cr>
    nnoremap <leader>/ :History/<cr>
    nnoremap <leader>] :Tags<cr>
    nnoremap <leader>` :Marks<cr>
    nnoremap <leader>G :Lines<cr>

    imap <c-x><c-k> <plug>(fzf-complete-word)
    imap <c-x><c-j> <plug>(fzf-complete-file)
    imap <c-x><c-f> <plug>(fzf-complete-path)
    imap <c-x><c-l> <plug>(fzf-complete-line)
endif

if PlugExists('gitgutter')
    let g:gitgutter_map_keys = 0

    nnoremap ]h <plug>GitGutterNextHunk
    nnoremap [h <plug>GitGutterPrevHunk

    omap ih <plug>GitGutterTextObjectInnerPending
    omap ah <plug>GitGutterTextObjectOuterPending
    xmap ih <plug>GitGutterTextObjectInnerVisual
    xmap ah <plug>GitGutterTextObjectOuterVisual
endif

if PlugExists('gutentags')
    let g:gutentags_enabled = CommandExists('ctags')
    let g:gutentags_project_root = ['.git']
    let g:gutentags_ctags_tagfile = '.git/tags'
endif

if PlugExists('indentline')
    let g:indentLine_char = '│'
    let g:indentLine_color_term = 0
endif

if PlugExists('nord-vim')
    let g:nord_italic = 1
    let g:nord_underline = 1
    let g:nord_uniform_diff_background = 1

    colorscheme nord
endif

if PlugExists('vim-easy-align')
    xmap ga <plug>(EasyAlign)
    nmap ga <plug>(EasyAlign)
endif

if PlugExists('vim-javascript')
    let g:javascript_plugin_jsdoc = 1
endif

if PlugExists('ultisnips')
    let g:UltiSnipsSnippetDirectories = [$SNIPS]
    let g:UltiSnipsExpandTrigger = '<tab>'
    let g:UltiSnipsJumpForwardTrigger = '<c-j>'
    let g:UltiSnipsJumpBackwardTrigger = '<c-k>'

    nnoremap <leader><s-tab> :UltiSnipsEdit<cr>
    inoremap <c-j> <nop>
endif
