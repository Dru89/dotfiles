" Use vim settings.  Should be default on nvim
set nocompatible

" Load the 'before' file if it exists
if filereadable(expand("~/.nvimrc.before"))
    source ~/.nvimrc/before
endif

" ================== GENERAL CONFIG ========================
set relativenumber                      " turn on relative line numbers
set backspace=indent,eol,start          " Make backspace work normally in insert mode
set history=1000                        " Lots of command history
set showcmd                             " Show incomplete commands on bottom
set showmode                            " Show the mode at the bottom
set gcr=a:blinkon0                      " Cursors that blink are the worst
set visualbell                          " No sounds
set autoread                            " Automatically reload a file when it's changed
set laststatus=2                        " Show two lines of status
set mouse=nvicr                         " Set up some mouse options: normal, visual, insert, command-line, and hit-enter prompt

" Hide buffers instead of killing them.
set hidden

" Turn on syntax highlighting
syntax on

" Set mapleader to ",", because it's closer.
let mapleader = ","


" ==================== PLUGINS =====================
call plug#begin()
Plug 'airblade/vim-gitgutter'
Plug 'bling/vim-airline'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'kana/vim-surround'
Plug 'kchmck/vim-coffee-script'
Plug 'majutsushi/tagbar'
Plug 'mileszs/ack.vim'
Plug 'mklabs/vim-fetch'
Plug 'othree/html5.vim'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-obsession'
Plug 'vimwiki/vimwiki'

" Requires dependencies on plugins above:
Plug 'gregsexton/gitv'            " => tpope/vim-fugitive
call plug#end()

filetype plugin on
filetype indent on


" ==================== SWAP FILES =======================
" Live on the edge.
set noswapfile
set nobackup
set nowb


" ==================== PERSISTENT UNDO ========================
if has('persistent_undo')
    silent !mkdir ~/.nvim/backups > /dev/null 2>&1
    set undodir=~/.nvim/backups
    set undofile
endif

" ==================== INDENTATION ===========================
set autoindent
set smartindent
set smarttab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab

" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·

set nowrap              " Don't wrap lines
set linebreak           " Wrap lines at convenient points
set textwidth=120       " Max width of text should be 120 characters


" ==================== FOLDS =============================
set foldmethod=indent   " Fold at the indent level
set foldnestmax=3       " Only fold to the third level   
set nofoldenable        " Don't turn on folding by default, though


" =================== COMPLETION ==========================
set wildmode=list:longest
set wildmenu
set wildignore=*.o,*.obj,*~
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif


" =============== SCROLLING ===================
set scrolloff=5
set sidescrolloff=10
set sidescroll=1


" =============== SEARCH ==================
set incsearch
set hlsearch
set ignorecase
set smartcase


" =============== CUSTOM SETTINGS ===============
source ~/.nvim/settings.vim
" Okay, I won't lie.  This is taken and modified from a number of sources.  It's grown a lot and changed a lot over
" time, so I'll try to list all of the places here:
" * https://github.com/skwp/dotfiles/blob/master/vimrc

" Learn Vimscript the Hard Way
nnoremap <leader><space> za
noremap <leader>- ddp
noremap <leader>_ ddkP
inoremap <leader><c-u> <esc>viwUi
nnoremap <leader><c-u> viwU
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
inoremap jk <esc>
