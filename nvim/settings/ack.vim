if executable('ag')
    let g:ackprg = 'ag --vimgrep'
    set grepprg=ag\ --vimgrep
endif

vnoremap <leader>a :Ack!<CR>
nnoremap <leader>a :Ack!<CR>
