" General
set nocompatible
syntax on
filetype indent on " load filetype specific indent files
filetype plugin on " load filetype specific plugins
let mapleader = ","

" Plugin stuff
call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'ying17zi/vim-live-latex-preview'
Plug 'scrooloose/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'

call plug#end()

" Colors
colorscheme gruvbox
set background=dark
syntax enable

" Tabs and Spaces
set expandtab " use <TAB> into spaces
set tabstop=4 " number of spaces per <TAB>
set softtabstop=4 " as above, when editing
set shiftwidth=4 " 4 spaces indent

" User Interface
set relativenumber " show relative line numbers
set showcmd " show command
set cursorline " highlight current line
set number " show line numbers
set showmatch " highlight matching brackets
set wildmenu " visual autocomplete commands
set lazyredraw " don't bother with redraw

" Shortcuts
nnoremap j gj
nnoremap k gk

" Searching
set incsearch " incremental searching
set hlsearch " highlight matches
" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR> 

" Functions
" toggle (no)relative number
function! ToggleNumber()
    if(&relativenumber == 1)
        set norelativenumber
        set number
    else
        set relativenumber
    endif
endfunc
