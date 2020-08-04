" General
set encoding=utf-8
let mapleader = ","

" Tabs and Spaces
set expandtab " expand <TAB> into spaces
set tabstop=4 " number of spaces per <TAB>
set softtabstop=4 " as above, when editing
set shiftwidth=4 " 4 spaces indent

" User Interface
set relativenumber " show relative line numbers
set showcmd " show command
set cursorline " highlight current line
set number " show line numbers
set showmatch " highlight matching brackets
set lazyredraw " don't bother with redraw
set noshowmode " editor mode replaced by lightline
set mouse=a "enable mouse
set clipboard+=unnamedplus " copy and paste outside vim

" Split in a non-retarted way
set splitbelow
set splitright

" Don't care if a line is wrapped
nnoremap j gj
nnoremap k gk

" Searching
" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR> 

augroup myfiletypes
    autocmd FileType ruby,html set ai sw=2 sts=2 et
    autocmd FileType make setlocal noexpandtab
    autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
augroup END

" Plugins
call plug#begin('~/.config/nvim/plugged')

Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'tpope/vim-fugitive'
Plug 'morhetz/gruvbox'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
call plug#end()


" Plugins configuration
let g:go_fmt_command = "goimports"
let g:go_auto_type_info = 1           " Automatically get signature/type info for object under cursor     
" disable vim-go :GoDef short cut (gd)
" this is handled by LanguageClient [LC]
let g:go_def_mapping_enabled = 0
" Make it possible to run metalinter if project has golangci.yml. Weird, but works.
let g:go_metalinter_enabled = []

set background=dark
let g:gruvbox_contrast_dark = "hard"
colorscheme gruvbox

" -------------------------------------------------------------------------------------------------
" coc.nvim default settings
" -------------------------------------------------------------------------------------------------

" if hidden is not set, TextEdit might fail.
set hidden
" Better display for messages
set cmdheight=2
" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300
" don't give |ins-completion-menu| messages.
set shortmess+=c
" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use U to show documentation in preview window
nnoremap <silent> U :call <SID>show_documentation()<CR>

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
