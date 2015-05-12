function! FZFGit()
    let me = expand('%:p:h')
    let gitd = finddir('.git', me.';')
    if empty(gitd)
        FZF
    else
        let gitp = fnamemodify(gitd, ':h')
        call fzf#run({
            \ 'source': 'git ls-files . --cached --exclude-standard --others',
            \ 'sink': 'e',
            \ 'up': 30,
            \ 'dir': gitp,
            \ 'options': '-m'
            \ })
    endif
endfunction
command! FZFGit call FZFGit()
nnoremap <silent> <leader><leader> :FZFGit<cr>
