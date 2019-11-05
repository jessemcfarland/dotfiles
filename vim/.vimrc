" .vimrc
set nocompatible            " be iMproved, required
filetype off                " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" all other Plugins
Plugin 'editorconfig/editorconfig-vim'
Plugin 'godlygeek/tabular'
Plugin 'honza/vim-snippets'
Plugin 'pearofducks/ansible-vim'
Plugin 'rodjek/vim-puppet'
Plugin 'tpope/vim-markdown'
Plugin 'vim-syntastic/syntastic'

" All of your Plugins must be added before the following line
call vundle#end()           " required

syntax enable               " enable syntax processing
filetype plugin indent on   " load filetype-specific indent files
set tabstop=4               " number of visual spaces per tab
set softtabstop=4           " number of spaces in tab when editing
set shiftwidth=4            " number of spaces to use for autoindent
set expandtab               " tabs are spaces
" uses shiftwidth instead of tabstop at start of lines
set smarttab
" when opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent
set number                  " show line numbers
set relativenumber          " show line numbers relative to current line
set ruler                   " show cursor position
set showcmd                 " show command in bottom bar
set cursorline              " highlight current line
set wildmenu                " visual autocomplete for command menu
set lazyredraw              " redraw only when we need to
set showmatch               " highlight matching [{()}]
set incsearch               " search as characters are entered
set hlsearch                " highlight matches

" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

" turn off line numbers
nnoremap <leader>n :set nonumber<CR>:set norelativenumber<CR>

" turn on line numbers
nnoremap <leader>N :set number<CR>:set relativenumber<CR>

" turn off relative line numbers
nnoremap <leader>r :set norelativenumber<CR>

" turn on relative line numbers
nnoremap <leader>R :set norelativenumber<CR>

" disable paste mode
nnoremap <leader>p :set nopaste<CR>

" enable paste mode
nnoremap <leader>P :set paste<CR>
