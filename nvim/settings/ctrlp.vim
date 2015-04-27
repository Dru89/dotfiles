if exists("g:ctrlp_user_command")
    unlet g:ctrlp_user_command
endif

set runtimepath^=~/.vim/bundle/ctrlp.vim

let g:ctrlp_match_window_bottom = 0
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v(\.(git|hg|svn)|build|vendor)$',
    \ 'file': '\v(\.(exe|so|dll|pyc|swp)|~)$',
    \ }
let g:ctrlp_extensions = ['buffertag']

let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others']

" Don't jump to an already open window
let g:ctrlp_switch_buffer = 0

" Map ctrlp to use <leader>t
let g:ctrlp_map = ',t'
nnoremap <silent> <leader>t :CtrlP<CR>

" Additional map for buffer searching
nnoremap <silent> <leader>b :CtrlPBuffer<CR>

" Clear CtrlP cache with Cmd-Shift-P
nnoremap <silent> <D-P> :ClearCtrlPCache<CR>

" Some quick 'jumps' to search for.
" See http://www.charlietanksley.net/blog/blog/2011/10/18/vim-navigation-with-lustyexplorer-and-lustyjuggler/
map <leader>jc :CtrlP core/src<CR>
map <leader>jw :CtrlP core/src/hcube/workflows<CR>
map <leader>jt :CtrlP core/mocha-tests<CR>
" TODO: think of more?

" Cmd-Shift-(M)ethod - jump to tag in file
nnoremap <silent> <D-M> :CtrlPBufTag<CR>
