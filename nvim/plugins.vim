if filereadable(expand("$XDG_DATA_HOME/nvim/site/autoload/plug.vim"))
    call plug#begin()

    Plug 'airblade/vim-gitgutter'
    Plug 'arcticicestudio/nord-vim'
    Plug 'hrsh7th/nvim-compe'
    Plug 'junegunn/fzf'
    Plug 'junegunn/fzf.vim'
    Plug 'junegunn/vim-easy-align',
    Plug 'michaeljsmith/vim-indent-object'
    Plug 'neovim/nvim-lspconfig'
    Plug 'preservim/nerdtree'
    Plug 'ryanoasis/vim-devicons'
    Plug 'sirver/ultisnips'
    Plug 'tomtom/tcomment_vim'
    Plug 'tpope/vim-eunuch'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-repeat'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-unimpaired'

    Plug 'sheerun/vim-polyglot'
    " Plug 'windwp/nvim-autopairs'
    " Plug 'windwp/nvim-ts-autotag'
    " Plug 'nvim-treesitter/nvim-treesitter'

    call plug#end()
end

if exists('g:plugs') && has_key(g:plugs, 'fzf.vim') && executable('fzf')
    let g:fzf_action = { 'ctrl-t': 'tab split', 'ctrl-s': 'split', 'ctrl-v': 'vsplit' }
    let g:fzf_commits_log_format = '--format="%C(red)%h %C(white)%s %C(green)%cr %C(blue)%an"'
    let g:fzf_commits_log_options = '--graph --color=always ' . g:fzf_commits_log_format
    let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8, 'border': 'sharp' } }

    command! -bang Buffers
        \ call fzf#vim#buffers({ 'options': '--no-preview' }, <bang>0)

    command! -bang Commits
        \ call fzf#vim#commits({ 'options': '--no-preview' }, <bang>0)

    command! -bang BCommits
        \ call fzf#vim#commits({ 'options': '--no-preview' }, <bang>0)

    command! -bang -nargs=? -complete=dir Files
        \ call fzf#vim#files(<q-args>, <bang>0)

    imap <c-x><c-k> <plug>(fzf-complete-word)
    imap <c-x><c-j> <plug>(fzf-complete-file)
    imap <c-x><c-p> <plug>(fzf-complete-path)
    imap <c-x><c-l> <plug>(fzf-complete-line)

    nnoremap <space><space> :Files<cr>
    nnoremap <space><tab> :Snippets<cr>
    nnoremap <space><bs> :Buffers<cr>
    nnoremap <space><cr> :GFiles<cr>
    nnoremap <space>\ :Commits!<cr>
    nnoremap <space>\| :BCommits!<cr>
    nnoremap <space>- :History<cr>
    nnoremap <space>/ :History/<cr>
    nnoremap <space>: :History:<cr>
    nnoremap <space>? :Helptags<cr>
    nnoremap <space>] :Tags<cr>
    nnoremap <space>} :BTags<cr>
    nnoremap <space>` :Marks<cr>
    nnoremap <space>g :Lines<cr>
    nnoremap <space>G :BLines<cr>
endif

if exists('g:plugs') && has_key(g:plugs, 'nord-vim')
    silent! colorscheme nord

    highlight CursorLineNr guibg=none
    highlight Normal guibg=none
    highlight NonText guibg=none
    highlight SignColumn guibg=none
    highlight VertSplit guibg=#3b4252
    highlight Pmenu guibg=#3b4252
    highlight StatusLine guibg=#3b4252 guifg=#e5e9f0
    highlight StatusLineNc guibg=#3b4252 guifg=#e5e9f0
    highlight LspDiagnosticsDefaultError guifg=#bf616a
    highlight LspVirtualFloatingError guifg=#bf616a
    highlight LspVirtualSignError guifg=#bf616a
    highlight LspVirtualTextError guifg=#bf616a
    highlight LspDiagnosticsDefaultWarning guifg=#ebcb8b
    highlight LspVirtualFloatingWarning guifg=#ebcb8b
    highlight LspVirtualSignWarning guifg=#ebcb8b
    highlight LspVirtualTextWarning guifg=#ebcb8b
    highlight LspDiagnosticsDefaultInformation guifg=#a3be8c
    highlight LspVirtualFloatingInformation guifg=#a3be8c
    highlight LspVirtualSignInformation guifg=#a3be8c
    highlight LspVirtualTextInformation guifg=#a3be8c
end

if exists('g:plugs') && has_key(g:plugs, 'nerdtree')
    nnoremap <silent> <cr><cr> :NERDTreeToggle<cr>
    nnoremap <silent> <cr>c :NERDTreeClose<cr>
    nnoremap <silent> <cr>r :NERDTreeRefreshRoot<cr>

    nnoremap <expr> <cr>w exists('b:NERDTree')
        \ ? '<c-w><c-p>'
        \ : ':NERDTreeFocus'

    nnoremap <expr> <cr>f exists('b:NERDTree')
        \ ? '<c-w><c-p>:NERDTreeFind<cr>'
        \ : ':NERDTreeFind<cr>'
endif

if exists('g:plugs') && has_key(g:plugs, 'ultisnips')
    let g:UltiSnipsSnippetDirectories = [ $XDG_CONFIG_HOME . '/nvim/ultisnips' ]
    let g:UltiSnipsExpandTrigger = '<tab>'
    let g:UltiSnipsJumpForwardTrigger = '<c-j>'
    let g:UltiSnipsJumpBackwardTrigger = '<c-k>'

    nnoremap <s-tab> :UltiSnipsEdit<cr>
endif

if exists('g:plugs') && has_key(g:plugs, 'vim-easy-align')
    nmap ga <Plug>(EasyAlign)
    xmap ga <Plug>(EasyAlign)
endif

if exists('g:plugs') && has_key(g:plugs, 'vim-fugitive')
    nnoremap gs :Git<cr>
    nnoremap gl :Gclog<cr>
endif

if exists('g:plugs') && has_key(g:plugs, 'vim-gitgutter')
    let g:gitgutter_map_keys = 0

    nmap ]c <plug>(GitGutterNextHunk)
    nmap [c <plug>(GitGutterPrevHunk)
    omap ic <plug>(GitGutterTextObjectInnerPending)
    omap ac <plug>(GitGutterTextObjectOuterPending)
    xmap ic <plug>(GitGutterTextObjectInnerVisual)
    xmap ac <plug>(GitGutterTextObjectInnerVisual)
endif
