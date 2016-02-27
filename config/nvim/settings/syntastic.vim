" Always show the error list for syntastic
let g:syntastic_always_populate_loc_list = 1

let g:syntastic_scss_checkers = ["scss_lint"]
let g:syntastic_javascript_checkers = ["eslint"]
let g:syntastic_markdown_checkers = ["mdl"]
let g:syntastic_html_tidy_ignore_errors = [
        \ "trimming empty <span>",
        \ "trimming empty <i>"
        \ ]

