set nu
syntax on
set autoindent        " set auto indent;
set tabstop=4         " tab occupies space number;
set shiftwidth=4
set backspace=2
set paste             " enable for <cmd+v> to paste;
set encoding=utf-8
set laststatus=2      " show status line always;
set showmode
set cursorline        " display cursor line;
set ignorecase        " ignore case when searching;

filetype plugin indent on   " Automatically detect file types.

" plugins begin;
" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.vim/plugged')

Plug 'junegunn/vim-easy-align'
" Plug 'fatih/vim-go'
Plug 'nsf/gocode'
" airline status line;
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'fugitive.vim'
" content tree;
Plug 'scrooloose/nerdtree'
Plug 'easymotion'
" table of functions;
Plug 'tagbar'
Plug 'scrooloose/nerdcommenter'
Plug 'kien/ctrlp.vim'
Plug 'kshenoy/vim-signature'
" multiple-cursors-edit;
Plug 'terryma/vim-multiple-cursors'
Plug 'bronson/vim-trailing-whitespace'
Plug 'scrooloose/syntastic'
" git diff show;
Plug 'airblade/vim-gitgutter'
" autopair;


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

" switch among different windows;
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" 快速注释 <leader>cc <leader>cu <leader>c<space>
" Plugin 'scrooloose/nerdcommenter'
" 注释的时候自动加个空格, 强迫症必配
let g:NERDSpaceDelims=1
" 整行注释，而不是只注释选中的
let NERDCommentWholeLinesInVMode=1

" 底部状态栏
" Plugin 'bling/vim-airline'
" let g:airline_powerline_fonts = 1 " enable powerline-fonts
let g:airline_theme="dark"
let g:airline#extensions#whitespace#mixed_indent_algo = 1
let g:airline#extensions#tabline#enabled = 1 " enable tabline
let g:airline#extensions#tabline#tab_nr_type = 1 " tab number
let g:airline#extensions#tabline#buffer_nr_show = 1

" directory tree
" Plugin 'scrooloose/nerdtree'

" ctrl+p, search file
" Plugin 'kien/ctrlp.vim'
map <C-K> :CtrlPBuffer<CR>

" 文件内跳转，<leader><leader>w/b/e 词跳转, j/k 行跳转, f/F/t/T 搜索
" Plugin 'Lokaltog/vim-easymotion'

" 显示marks - 方便自己进行标记和跳转
" m[a-zA-Z] add mark
" '[a-zA-Z] go to mark
" m<Space>  del all marks
" Plugin 'kshenoy/vim-signature'
let g:SignatureEnabledAtStartup = 0
map <leader>m :SignatureToggleSigns<CR>

" <C-N> 多重选择/替换
" Plugin 'terryma/vim-multiple-cursors'

" 删除行末空格
" Plugin 'bronson/vim-trailing-whitespace'
map <leader><space> :FixWhitespace<cr>

" taglist
" Plugin 'majutsushi/tagbar'
map <leader>t :Tagbar<CR>
" 启动时自动focus
let g:tagbar_autofocus = 1

" syntax check
" Plugin 'scrooloose/syntastic'
map <leader>s :SyntasticToggleMode<CR>
let g:syntastic_mode_map = { 'mode': 'active',
            \ 'active_filetypes': [],
            \ 'passive_filetypes': ['c', 'java'] }
let g:syntastic_error_symbol='>>'
let g:syntastic_warning_symbol='>'
let g:syntastic_check_on_open=1
let g:syntastic_enable_highlighting=0
let g:syntastic_python_checkers=['pyflakes']
let g:syntastic_c_check_header = 1
let g:syntastic_c_no_inclued_search = 1
let g:syntastic_c_no_default_include_dirs = 1
let g:syntastic_c_auto_refresh_includes = 1
let g:syntastic_c_compiler_options = '-Wall'
highlight SyntasticErrorSign guifg=white guibg=black

" python 自动补全
" Plugin 'davidhalter/jedi-vim'
" let g:jedi#completions_command = "<C-/>"

" 使用 tab 键补全
" Plugin 'ervandew/supertab'

" 中文文档
" Plugin 'vimcn/vimcdoc'

" 生成 doxygen 注释
" :DoxAuthor 	将文件名，作者，时间等
" :DoxLic 	license注释
" :Dox 		函数及类注释
" Plugin 'DoxygenToolkit.vim'

" solarized 主题
" Plugin 'altercation/vim-colors-solarized'
" let g:solarized_termcolors=256

" 搜索dash
" Plugin 'rizzatti/dash.vim'
" nmap <silent> <leader>d <Plug>DashSearch

filetype plugin on
filetype plugin indent on

" -- key map --

" reload ~/.vimrc
map<leader>r :source ~/.vimrc <CR>
map<leader>u :call UpdateCtagsCscope() <CR><CR><CR>
map <leader>c :make <CR><CR><CR>
nmap <leader>c <ESC> :make <CR><CR><CR>
map <leader>p :set invpaste <CR>
" Make Y yank everything from the cursor to the end of the line. This makes Y
" act more like C or D because by default, Y yanks the current line (i.e. the
" same as yy).
noremap Y y$
" Stay in visual mode when indenting. You will never have to run gv after
" performing an indentation.
vnoremap < <gv
vnoremap > >gv

" -- gui depend --
if has("gui_running")
    set guioptions-=T
    source $VIMRUNTIME/delmenu.vim
    source $VIMRUNTIME/menu.vim
    source $VIMRUNTIME/mswin.vim
    behave mswin

    set guifont=Source\ Code\ Pro\ ExtraLight:h14
    set background=dark
    colorscheme desert
    let g:airline_powerline_fonts = 1 " enable powerline-fonts
else
    colorschem desert
    highlight TabLine ctermbg=4
endif

" -- autocmd --
" different indent of language
set tabstop=4 		" 文件里的 <Tab> 代表的空格数
set shiftwidth=4 	" (自动) 缩进每一步使用的空白数目
" set expandtab  		" <Tab> 展开为空格
set softtabstop=4 	" 输入<Tab> 时, 插入的空格数
set autoindent 		" 开启新行时，从当前行复制缩进
" if has("autocmd")
"     autocmd FileType python,ruby,css
"                 \ setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab
"
"     autocmd FileType java,javascript
"                 \ setlocal tabstop=4 shiftwidth=4 softtabstop=4 cindent expandtab
"     autocmd FileType cpp,c
"                 \ setlocal tabstop=4 shiftwidth=8 softtabstop=8 cindent noexpandtab
" endif

" -- switch tab --
map L :tabnext <CR>
nmap L :tabnext <CR>
map H :tabprevious <CR>
nmap H :tabprevious <CR>

" -- save session --
autocmd VimEnter *
            \ if argc() == 0 && filereadable("Session.vim") |
            \ source Session.vim |
            \ endif
autocmd VimLeave *
            \ if argc() == 0 && filereadable("Session.vim") |
            \ mksession! |
            \ endif

" -- functions --
function! UpdateCtagsCscope()
    !gtags
    " ! ctags -R; cscope -ubR
    cs r
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" cscope setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("cscope")
  set csto=1
  set cst
  set nocsverb
  set cscopetag " 使用 cscope 作为 tags 命令
  set cscopeprg='gtags-cscope'
  " add any database in current directory
  if filereadable("GTAGS")
      cs add GTAGS
  endif
  set csverb
endif

nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" buffer setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" buffer快速导航
nnoremap <Leader>b :bp<CR>
nnoremap <Leader>f :bn<CR>
" 查看buffers
nnoremap <Leader>l :ls<CR>
" 通过索引快速跳转
nnoremap <Leader>1 :1b<CR>
nnoremap <Leader>2 :2b<CR>
nnoremap <Leader>3 :3b<CR>
nnoremap <Leader>4 :4b<CR>
nnoremap <Leader>5 :5b<CR>
nnoremap <Leader>6 :6b<CR>
nnoremap <Leader>7 :7b<CR>
nnoremap <Leader>8 :8b<CR>
nnoremap <Leader>9 :9b<CR>
nnoremap <Leader>0 :10b<CR>

