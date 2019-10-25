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
set noshowmode

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
nnoremap <C-y> :tabclose<CR>
" Remap next tab
nnoremap <C-m> :tabnext<CR>
" Remap previous tab
nnoremap <C-n> :tabprevious<CR>
" Don't care if a line is wrapped
nnoremap j gj
nnoremap k gk
" Copy and paste outside vim
vnoremap <C-c> "*y :let @+=@*<CR>
map <C-p> "+P
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

augroup myfiletypes
    autocmd FileType ruby,html set ai sw=2 sts=2 et    
    autocmd FileType make setlocal noexpandtab    
augroup END


" Plugins
call plug#begin('~/.config/nvim/plugged')

Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-dispatch'
Plug '/usr/bin/fzf'
Plug 'w0rp/ale'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'junegunn/goyo.vim'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'deoplete-plugins/deoplete-go', { 'do': 'make'}
Plug 'stamblerre/gocode', { 'rtp': 'nvim', 'do': '~/.config/nvim/plugged/gocode/nvim/symlink.sh' }
" Python
Plug 'davidhalter/jedi'
Plug 'deoplete-plugins/deoplete-jedi'

call plug#end()


" Plugins configuration
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#go#gocode_binary = '$GOPATH/bin/gocode'
color dracula
