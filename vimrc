"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" VUNDLER
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'kien/ctrlp.vim'
Plugin 'othree/html5.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'msanders/snipmate.vim'
Plugin 'ervandew/supertab'
Plugin 'scrooloose/syntastic'
Plugin 'kchmck/vim-coffee-script'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'elzr/vim-json'
Plugin 'Lokaltog/vim-powerline'
Plugin 'tpope/vim-rails'
Plugin 'ecomba/vim-ruby-refactoring'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-surround'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'gmarik/Vundle.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" GENERAL PREFERENCES
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set laststatus=2
set showmatch
set incsearch
set hlsearch

" make searches case-sensitive only if they contain upper-case characters
set ignorecase smartcase

" highlight current line
set cursorline
set cmdheight=2
set switchbuf=useopen
set numberwidth=5
set showtabline=2

" Enables mouse
set mouse=a

set noswapfile
set nobackup

set wildignore+=*/node_modules/*

" Fold
set foldmethod=indent
set foldlevelstart=20

" Numbers
set number




"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" MAPPINGS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let mapleader=","
map ! :!
" Change to alternate file
map <leader><leader> <c-^>

" Create folders
map <leader>f :!mkdir -p %%
map <leader>F :!mkdir -p


vmap <C-c> :w !pbcopy<CR>

" Nerdtree
nmap <silent> <C-D> :NERDTreeToggle<CR>

" Whitespace remove
nmap <silent> dws :FixWhitespace<CR>

" Split line into new line
nnoremap K i<CR><Esc>

" Move around splits with <c-hjkl>
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

map <leader>p :CtrlP<cr>




"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" VISUALS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Enable highlighting for syntax
syntax on

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

if has("gui_running")
   set guioptions=egmrt
   set guifont:Monaco:h12
endif

if exists('+colorcolumn')
  set colorcolumn=80
endif

syntax enable
set background=dark
let &t_Co=256
let g:solarized_termcolors=256
colorscheme solarized




"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" PLUGIN SPECIFIC
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""" NERD TREE
autocmd bufenter *
  \ if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") |
  \   q |
  \ endif
