source $XDG_CONFIG_HOME/nvim/vim/settings.vim
source $XDG_CONFIG_HOME/nvim/vim/commands.vim
source $XDG_CONFIG_HOME/nvim/vim/mappings.vim
source $XDG_CONFIG_HOME/nvim/vim/plugins.vim

colorscheme custom

" TODO remove
let mapleader = ' '
nnoremap <silent> <leader>s :so $MYVIMRC<cr>
nnoremap <silent> <leader>g :Goyo<cr>
nnoremap <leader>H :so $VIMRUNTIME/syntax/hitest.vim<cr>
map <leader>h :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
    \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
    \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
