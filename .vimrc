" Plugin stuff
call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'

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
set showcmd " show command
set cursorline " highlight current line
set number " show line numbers
filetype indent on " load filetype specific files
set showmatch " highlight matching brackets
set wildmenu " visual autocomplete commands
set lazyredraw " don't bother with redraw

" Searching
set incsearch " incremental searching
set hlsearch " highlight matches
" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR> 
