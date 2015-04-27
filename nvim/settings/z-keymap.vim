nnoremap Y y$

nnoremap 0 ^
nnoremap ^ 0

nnoremap j gj
nnoremap k gk
nnoremap <C-e> :e#<CR>
nnoremap <silent> \l :setlocal number! relativenumber!<CR>
nnoremap <silent> \p :set paste!<CR>
nnoremap <silent> \w :call ToggleList("Location List", 'l')<CR>
nnoremap <silent> \q :call ToggleList("Quickfix List", 'c')<CR>
nnoremap <silent> \g :GitGutterToggle<CR>

nnoremap <leader>cn :cn<CR>
nnoremap <leader>cp :cp<CR>
nnoremap <leader>cc :cc<CR>

nnoremap <silent> ,z :bp<CR>
nnoremap <silent> ,x :bn<CR>

if has("nvim")
    " Noremap in the terminal
    tnoremap <C-g> <C-\><C-n>
endif

function! GetBufferList()
  redir =>buflist
  silent! ls
  redir END
  return buflist
endfunction

function! ToggleList(bufname, pfx)
  let buflist = GetBufferList()
  for bufnum in map(filter(split(buflist, '\n'), 'v:val =~ "'.a:bufname.'"'), 'str2nr(matchstr(v:val, "\\d\\+"))')
    if bufwinnr(bufnum) != -1
      exec(a:pfx.'close')
      return
    endif
  endfor
  if a:pfx == 'l' && len(getloclist(0)) == 0
      echohl ErrorMsg
      echo "Location List is Empty."
      return
  endif
  let winnr = winnr()
  exec(a:pfx.'open')
  if winnr() != winnr
    wincmd p
  endif
endfunction

nmap \t :TagbarToggle<CR>
