" TODO: write more comments
" TODO: use folding
" TODO: remap esc(?)
" General
set nocompatible
syntax on
filetype indent on " load filetype specific indent files
filetype plugin on " load filetype specific plugins
set encoding=utf-8
let mapleader = ","

" Colors
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
" Split in a non-retarted way
set splitbelow
set splitright
" Set g flag for search/replace
set gdefault
" Enable mouse
set mouse=a
set scrolloff=3
set laststatus=2

" Shortcuts
" Split navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
" Remap new tab
nnoremap <C-t> :tabnew<CR>
" Remap close tab
nnoremap <C-w> :tabclose<CR>
" Remap next tab
nnoremap <C-l> :tabnext<CR>
" Remap previous tab
nnoremap <C-h> :tabprevious<CR>
" Don't care if a line is wrapped
nnoremap j gj
nnoremap k gk
" Save as a root
noremap <leader>W :w !sudo tee % > /dev/null<CR>
" Jump to <++>
" TODO: implement <++> as a jump point when writing parentheses, writing in tags, etc.
" TODO: do not highlight
inoremap <leader><leader> <Esc>/<++><Enter>ciW

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


" Plugins
call plug#begin('~/.vim/plugged')

Plug 'Valloric/YouCompleteMe'
Plug 'itchyny/lightline.vim'

call plug#end()
