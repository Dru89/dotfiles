if exists("g:ctrlp_user_command")
    unlet g:ctrlp_user_command
endif

set runtimepath^=~/.vim/bundle/ctrlp.vim

let g:ctrlp_match_window_bottom = 0
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_extensions = ['buffertag']


if executable('ag')
    let command = ['.git', 'ag %s -l --nocolor -g ""']
    let fallback = 'ag %s -l --nocolor -g ""'
    let g:ctrlp_use_caching = 0
else
    let command = ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others']
    let fallback = 'find %s -type f'
endif

let g:ctrlp_user_command = {
            \ 'types': {
            \      1: command
            \      },
            \ 'fallback': fallback
            \ }

let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v(\.(git|hg|svn)|build|vendor)$',
    \ 'file': '\v(\.(exe|so|dll|pyc|swp)|~)$',
    \ }

" Don't jump to an already open window
let g:ctrlp_switch_buffer = 0

" Map ctrlp to use <leader>t
let g:ctrlp_map = ',t'
nnoremap <silent> <leader>t :CtrlP<CR>

" Additional map for buffer searching
nnoremap <silent> <leader>b :CtrlPBuffer<CR>

" Clear CtrlP cache with Cmd-Shift-P
nnoremap <silent> <D-P> :ClearCtrlPCache<CR>

" Cmd-Shift-(M)ethod - jump to tag in file
nnoremap <silent> <D-M> :CtrlPBufTag<CR>
