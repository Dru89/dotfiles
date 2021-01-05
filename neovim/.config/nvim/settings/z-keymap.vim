" Make Y act like D, C, etc.
nnoremap Y y$

" Use 0 to go to beginning of code, ^ to go to beginning of line
nnoremap 0 ^
nnoremap ^ 0

" j and k should move with word-wraps
nnoremap j gj
nnoremap k gk

" "Open last file" is a common idea. Map it to ^e
nnoremap <C-e> :e#<CR>

" Some common toggles
nnoremap <silent> \l :setlocal number! relativenumber!<CR>
nnoremap <silent> \p :set paste!<CR>
nnoremap <silent> \w :call ToggleList("Location List", 'l')<CR>
nnoremap <silent> \q :call ToggleList("Quickfix List", 'c')<CR>
nnoremap <silent> \g :GitGutterToggle<CR>

" Move through quickfix/location list
nnoremap <leader>cn :cnext<CR>
nnoremap <leader>cp :cprevious<CR>
nnoremap <leader>cc :cc<CR>
nnoremap <leader>ln :lnext<CR>
nnoremap <leader>lp :lprevious<CR>
nnoremap <leader>ll :ll<CR>

" Move through buffers
nnoremap <silent> <leader>z :bprevious<CR>
nnoremap <silent> <leader>x :bnext<CR>

" j/k for <ESC>
inoremap <silent> jk <esc>
cnoremap <silent> jk <C-c>
" This makes visual selection too slow :(
" xnoremap <silent> jk <esc>

" Find a file
nnoremap \e :Explore<CR>
nnoremap <leader>e :NERDTreeToggle<CR>
nnoremap <leader>f :NERDTreeFind<CR>

" move through splits
nnoremap <silent> <C-h> <C-w>h
nnoremap <silent> <C-j> <C-w>j
nnoremap <silent> <C-k> <C-w>k
nnoremap <silent> <C-l> <C-w>l

if has("nvim")
    " ===== TERMINAL mappings =====
    " Use <esc> to exit terminal mode
    tnoremap <silent> <ESC> <C-\><C-n>
    tnoremap <silent> <C-h> <C-\><C-n><C-w>h
    tnoremap <silent> <C-j> <C-\><C-n><C-w>j
    tnoremap <silent> <C-k> <C-\><C-n><C-w>k
    tnoremap <silent> <C-l> <C-\><C-n><C-w>l
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
