if has("gui_running")
    set t_Co=256

    set lines=75 
    set columns=260

    autocmd VimEnter * set guitablabel=%N:\ %t\ %M

    set guifont=Fantasque\ Sans\ Mono:h16   " Set the font in the GUI to something nice.
endif

colorscheme molokai
let g:molokai_original = 1
let g:rehash256 = 1
let g:airline_powerline_fonts = 1
