" Enable relative line number when in normal mode, and disable it for insert mode
set number
autocmd InsertEnter * :set norelativenumber
autocmd InsertLeave * :set relativenumber

" Convert tab to 4 spaces
set shiftwidth=4 smarttab
set expandtab
set smartindent
set tabstop=8 softtabstop=0

" Enable syntax highlighting
syntax on
colorscheme lunaperche
set background=dark
set mouse=a
