let g:vimwiki_hl_cb_checked = 1
let g:vimwiki_html_header_numbering = 1

let syntaxes = {
    \ 'python': 'python',
    \ 'vim': 'vim',
    \ 'coffee': 'coffee',
    \ 'scss': 'scss',
    \ 'html': 'html'
    \ }

let g:vimwiki_list = [
        \ {'path': '~/Dropbox/vimwiki/src', 'path_html': '~/Dropbox/vimwiki/html',
        \       'syntax': 'markdown', 'ext': '.md',
        \       'nested_syntaxes': syntaxes,
        \       'custom_wiki2html': '~/.nvim/scripts/vimwiki2html.py',
        \       'template_path': '~/Dropbox/vimwiki/templates',
        \       'template_default': 'default', 'template_ext': '.html'
        \ }]
 " http://code.google.com/p/vimwiki/issues/detail?id=384
 " :help vimwiki-option-custom_wiki2html

nnoremap <leader>wa :VimwikiAll2HTML
