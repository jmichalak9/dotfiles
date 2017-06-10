" Plugin stuff
call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'

call plug#end()

" Colors
colorscheme gruvbox
set background=dark
syntax enable

" tabs and spaces
set expandtab " use <TAB> into spaces
set tabstop=4 " number of spaces per <TAB>
set softtabstop=4 " as above, when editing
set shiftwidth=4 " 4 spaces indent

