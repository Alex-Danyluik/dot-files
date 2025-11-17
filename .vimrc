set termguicolors
set foldlevel=12
set cursorline
set colorcolumn=80
set foldmethod=syntax
set incsearch
set signcolumn=yes

" Enable syntax highlighting
syntax on
set background=dark
set mouse=a
colorscheme mild-dark

set number
autocmd InsertEnter * :set norelativenumber
autocmd InsertLeave * :set relativenumber

" Convert tab to 4 spaces
set shiftwidth=4 smarttab
set expandtab
set smartindent
set tabstop=8 softtabstop=0

