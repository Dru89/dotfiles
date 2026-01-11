nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gb :Gblame<CR>

nnoremap <leader>dg :diffget<CR>
nnoremap <leader>dp :diffput<CR>

set diffopt+=vertical

autocmd BufReadPost fugitive://* set bufhidden=delete
