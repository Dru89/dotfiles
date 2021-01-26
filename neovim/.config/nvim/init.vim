" Use vim settings.  Should be default on nvim
set nocompatible

" ==================== PLUGINS =====================
call plug#begin()
"Lots of plugins use this.  Put it first.
Plug 'tpope/vim-repeat'

Plug 'airblade/vim-gitgutter'
Plug 'aklt/plantuml-syntax'
Plug 'ap/vim-css-color'
Plug 'bling/vim-airline'
Plug 'briancollins/vim-jst'
Plug 'chaquotay/ftl-vim-syntax'
Plug 'chooh/brightscript.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'digitaltoad/vim-pug'
Plug 'ervandew/supertab'
Plug 'fatih/vim-go'
Plug 'flazz/vim-colorschemes'
Plug 'groenewege/vim-less'
Plug 'hail2u/vim-css3-syntax'
Plug 'honza/vim-snippets'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-after-object'
Plug 'junegunn/vim-emoji'
Plug 'junegunn/vim-journal'
Plug 'junegunn/vim-peekaboo'
Plug 'justinmk/vim-gtfo'
Plug 'kana/vim-surround'
Plug 'kchmck/vim-coffee-script'
Plug 'leafgarland/typescript-vim'
Plug 'majutsushi/tagbar'
Plug 'mattn/calendar-vim'
Plug 'mileszs/ack.vim'
Plug 'mklabs/vim-fetch'
Plug 'mxw/vim-jsx'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'othree/html5.vim'
Plug 'pangloss/vim-javascript'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-liquid'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'udalov/kotlin-vim'
Plug 'vito-c/jq.vim'
Plug 'wellle/targets.vim'

" Requires dependencies on plugins above:
Plug 'gregsexton/gitv'            " => tpope/vim-fugitive
call plug#end()

filetype plugin on
filetype indent on

" ================== GENERAL CONFIG ========================
set autoread                            " Automatically reload a file when it's changed
set backspace=indent,eol,start          " Make backspace work normally in insert mode
set gcr=a:blinkon0                      " Cursors that blink are the worst
set history=1000                        " Lots of command history
set laststatus=2                        " Show two lines of status
set mouse=nvicr                         " Set up some mouse options: normal, visual, insert, command-line, and hit-enter prompt
set relativenumber                      " turn on relative line numbers
set shortmess=aIT                       " Abbreviate some messages, don't show :intro
set showcmd                             " Show incomplete commands on bottom
set showmode                            " Show the mode at the bottom
set visualbell                          " No sounds

" Hide buffers instead of killing them.
set hidden

" Allow to position the cursor "between" characters in block mode.
set virtualedit=block

" Don't break on after a one-letter word. Remove comment leaders.
set formatoptions+=1j

" Turn on syntax highlighting
syntax on

" Set mapleader to ",", because it's closer.
let mapleader = ","

" ==================== SWAP FILES =======================
" Live on the edge.
set noswapfile
set nobackup
set nowb


" ==================== PERSISTENT UNDO ========================
if has('persistent_undo')
    silent !mkdir ~/.config/nvim/backups > /dev/null 2>&1
    set undodir=~/.config/nvim/backups
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
source ~/.config/nvim/settings.vim
" Okay, I won't lie.  This is taken and modified from a number of sources.  It's grown a lot and changed a lot over
" time, so I'll try to list all of the places here:
" * https://github.com/skwp/dotfiles/blob/master/vimrc

inoremap jk <esc>
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
