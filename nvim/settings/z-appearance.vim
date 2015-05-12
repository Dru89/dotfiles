if has("gui_running")
    set t_Co=256

    set lines=75 
    set columns=260

    autocmd VimEnter * set guitablabel=%N:\ %t\ %M

    set guifont=Fantasque\ Sans\ Mono:h16   " Set the font in the GUI to something nice.
endif

let g:molokai_original = 1
let g:rehash256 = 1
colorscheme molokai
let g:airline_powerline_fonts = 1

function! s:hl()
  " echo synIDattr(synID(line('.'), col('.'), 0), 'name')
  echo join(map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")'), '/')
endfunction
command! HL call <SID>hl()
