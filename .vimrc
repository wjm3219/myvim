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
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'fugitive.vim'
Plug 'scrooloose/nerdtree'
Plug 'easymotion'
Plug 'tagbar'

call plug#end()
" plugins end;

" my airline configure;
let g:airline#extensions#tabline#enabled = 1
let g:airline_left_sep='>'
let g:airline_right_sep='<'
let g:airline_detect_modified=1
let g:airline_detect_paste=1
let g:airline_theme='dark'
let g:airline_powerline_fonts = 1 
let g:airline#extensions#branch#format = 0

