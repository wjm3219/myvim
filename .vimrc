set nu
syntax on
set autoindent
set tabstop=4
set shiftwidth=4
set backspace=2
set paste

" plugins begin;
" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.vim/plugged')

Plug 'junegunn/vim-easy-align'
Plug 'fatih/vim-go'
Plug 'nsf/gocode'

call plug#end()
" plugins end;
