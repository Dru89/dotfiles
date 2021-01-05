" Ideas gathered from:
" * https://github.com/chriskempson/vim-tomorrow-theme (for functions/file format)
" * https://github.com/philplckthun/Adventurous-Syntax (for theme)
" * https://github.com/tomasr/molokai

" @jake-the-dog: #F5BB12;
" @rawr: #FFC620;
" @peppermint-butler: #D3422E;
" @finns-bag: #4BAE16;
" @ice-king: #7fd6fa;
" @finn-the-human: #277BD3;
" @heartbreaker: #f25a55;
" @princess: #de347a;
" @adventure-time: #3299CC;
"
" // Standard Color Application
" @cyan: #8abeb7;
" @blue: @finn-the-human;
" @purple: @adventure-time;
" @green: @finns-bag;
" @red: @heartbreaker;
" @dark-red: @peppermint-butler;
" @orange: #de935f;
" @light-orange: #f0c674;
" @bright-orange: @jake-the-dog;
"
" @darkness: #191B1F;
"
" // Shades of Grey?!
" @very-light-gray: #c5c8c6;
" @light-gray: #bdbdbd;
" @gray: #373b41;
" @dark-gray: lighten(@darkness, 5%);
" @very-dark-gray: @darkness;
"
" // Colors to Feelings
" @energetic: @jake-the-dog;
" @hyperactive: @rawr;
" @passive: @adventure-time;
" @discrete: #BFD7DB;
" @ghostly: #404449;
" @posh: @peppermint-butler;
" @warm: @heartbreaker;
" @positive: @finns-bag;
" @cold: @ice-king;
" @intensive: @finn-the-human;
" @important: @princess;


hi clear
syntax reset
set background=dark

let g:colors_name = "adventurous"


"===========================================
"               HTML COLORS
"===========================================
let s:jake_the_dog = "#F5BB12"
let s:rawr = "#FFC620"
let s:peppermint_butler = "#D3422E"
let s:finns_bag = "#4BAE16"
let s:ice_king = "#7FD6FA"
let s:finn_the_human = "#277BD3"
let s:heartbreaker = "#F25A55"
let s:princess = "#DE347A"
let s:adventure_time = "#3299CC"

" Standard Color Application
let s:cyan = "#8ABEB7"
let s:blue = s:finn_the_human
let s:purple = s:adventure_time
let s:green = s:finns_bag
let s:red = s:heartbreaker
let s:dark_red = s:peppermint_butler
let s:orange = "#DE935F"
let s:light_orange = "#F0C674"
let s:bright_orange = s:jake_the_dog

let s:darkness = "#191B1F"

" Shades of Grey?!
let s:very_light_gray = "#C5C8C6"
let s:light_gray = "#BDBDBD"
let s:gray = "#373B41"
let s:dark_gray = "#24272D" " lighten(s:darkness, 5%)
let s:very_dark_gray = s:darkness

" Colors to Feelings
let s:energetic = s:jake_the_dog
let s:hyperactive = s:rawr
let s:passive = s:adventure_time
let s:discrete = "#BFD7DB"
let s:ghostly = "#404449"
let s:posh = s:peppermint_butler
let s:warm = s:heartbreaker
let s:positive = s:finns_bag
let s:cold = s:ice_king
let s:intensive = s:finn_the_human
let s:important = s:princess

" General colors
let s:syntax_text_color = s:discrete
let s:syntax_cursor_color = "#FFFFFF"
let s:syntax_selection_color = "#30343B" " lighten(s:darkness, 10%)
let s:syntax_selection_flash_color = s:very_light_gray
let s:syntax_background_color = s:darkness

" Guide colors
let s:syntax_wrap_guide_color = s:dark_gray
let s:syntax_indent_guide_color = s:gray
let s:syntax_invisible_character_color = s:gray

" For find and replace markers
let s:syntax_result_marker_color = s:light_gray
let s:syntax_result_marker_color_selected = "#FFFFFF"

" Gutter colors
let s:syntax_gutter_text_color = s:very_light_gray
let s:syntax_gutter_text_color_selected = s:syntax_gutter_text_color
let s:syntax_gutter_background_color = s:dark_gray
let s:syntax_gutter_background_color_selected = s:gray

" For git diff info. i.e. in the gutter
let s:syntax_color_renamed = s:blue
let s:syntax_color_added = s:green
let s:syntax_color_modified = s:orange
let s:syntax_color_removed = s:red

let s:html_to_ansi = {
            \ "#000000": 16,
            \ "#191B1F": 233,
            \ "#24272D": 235,
            \ "#277BD3": 32,
            \ "#3299CC": 68,
            \ "#373B41": 239,
            \ "#404449": 59,
            \ "#4BAE16": 70,
            \ "#7FD6FA": 117,
            \ "#8ABEB7": 109,
            \ "#BDBDBD": 243,
            \ "#BFD7DB": 152,
            \ "#C5C8C6": 188,
            \ "#D3422E": 166,
            \ "#DE347A": 168,
            \ "#DE935F": 173,
            \ "#F0C674": 222,
            \ "#F25A55": 203,
            \ "#F5BB12": 214,
            \ "#FFC620": 220,
            \ "#FFFFFF": 15,
            \ }

fun <SID>ansi(html)
    " HTML -> ANSI Translations
    if has_key(s:html_to_ansi, a:html)
        return s:html_to_ansi[a:html]
    elseif match(a:html, '#[A-F0-9][A-F0-9][A-F0-9][A-F0-9][A-F0-9][A-F0-9]') == -1
        " Not an HTML code.  Just return the same value.
        return a:html
    else
        echoerr "Unknown HTML code " . a:html . ".  Did you add it to s:html_to_ansi?"
    endif
endfun

fun <SID>X(group, fg, bg, attr)
    if a:fg != ""
        exec "hi " . a:group . " guifg=" . a:fg . " ctermfg=" . <SID>ansi(a:fg)
    endif
    if a:bg != ""
        exec "hi " . a:group . " guibg=" . a:bg . " ctermbg=" . <SID>ansi(a:bg)
    endif
    if a:attr != ""
        exec "hi " . a:group . " gui=" . a:attr . " cterm=" . a:attr
    endif
endfun

fun <SID>XSP(group, rgb, cterm, attr)
    if a:rgb != ""
        exec "hi " . a:group . " guisp=" . a:rgb
        if a:cterm != ""
            exec "hi " a:group . " " . a:cterm . "=" . <SID>ansi(a:rgb)
        else
            exec "hi " a:group . " ctermfg=" . <SID>ansi(a:rgb)
        endif
    endif
    if a:attr != ""
        exec "hi " . a:group . " gui=" . a:attr . " cterm=" . a:attr
    endif
endfun

call <SID>X("Normal", s:discrete, s:darkness, "")
call <SID>X("Boolean", s:important, "", "")
call <SID>X("Character", s:cold, "", "")
call <SID>X("Number", s:energetic, "", "")
call <SID>X("String", s:cold, "", "")
call <SID>X("Conditional", s:energetic, "", "")
call <SID>X("Constant", s:intensive, "", "")
call <SID>X("Cursor", s:syntax_cursor_color, "", "")
call <SID>X("iCursor", s:syntax_cursor_color, "", "")
call <SID>X("Debug", s:orange, "", "bold")
call <SID>X("Define", s:posh, "", "bold")
call <SID>X("Delimiter", s:gray, "", "")
call <SID>X("DiffAdd", "", s:intensive, "")
call <SID>X("DiffDelete", s:important, s:darkness, "")
call <SID>X("DiffChange", s:orange, s:gray, "")
call <SID>X("DiffText", s:orange, s:light_gray, "italic,bold")

call <SID>X("Directory", s:finns_bag, "", "bold")
call <SID>X("Error", s:warm, s:darkness, "")
call <SID>X("ErrorMsg", s:warm, s:darkness, "")
call <SID>X("Exception", s:positive, "", "bold")
call <SID>X("Float", s:energetic, "", "")
call <SID>X("FoldColumn", s:passive, s:darkness, "")
call <SID>X("Folded", s:passive, s:darkness, "")
call <SID>X("Function", s:hyperactive, "", "")
call <SID>X("Identifier", s:blue, "", "")
call <SID>X("Ignore", s:light_gray, "", "")
call <SID>X("IncSearch", s:cold, s:darkness, "")

call <SID>X("Keyword", s:posh, "", "")
call <SID>X("Label", s:cold, "", "")
call <SID>X("Macro", s:posh, "", "bold")
call <SID>X("SpecialKey", s:posh, "", "bold")

call <SID>XSP("MatchParen", s:positive, "", "underline")
call <SID>X("ModeMsg", s:cold, "", "")
call <SID>X("MoreMsg", s:cold, "", "")
call <SID>X("Operator", s:energetic, "", "")

call <SID>X("Pmenu", s:intensive, s:darkness, "")
call <SID>X("PmenuSel", s:cold, s:gray, "")
call <SID>X("PmenuSbar", "", s:darkness, "")
call <SID>X("PmenuThumb", "", s:passive, "")

call <SID>X("PreCondit", s:finns_bag, "", "bold")
call <SID>X("PreProc", s:finns_bag, "", "")
call <SID>X("Question", s:cold, "", "")
call <SID>X("Repeat", s:energetic, "", "bold")
call <SID>X("Search", s:darkness, s:ghostly, "")

call <SID>X("SignColumn", s:very_light_gray, s:dark_gray, "")
call <SID>X("SpecialChar", s:energetic, "", "bold")
call <SID>X("SpecialComment", s:light_gray, "", "bold")
call <SID>X("Special", s:posh, "", "italic")

if has("spell")
    call <SID>XSP("SpellBad", s:warm, "ctermbg", "undercurl")
    call <SID>XSP("SpellCap", s:passive, "ctermbg", "undercurl")
    call <SID>XSP("SpellLocal", s:passive, "ctermbg", "undercurl")
    call <SID>XSP("SpellRare", s:very_light_gray, "", "undercurl")
    hi SpellRare ctermfg=none ctermbg=none cterm=reverse
endif

call <SID>X("Statement", s:important, "", "bold")
call <SID>X("StatusLine", s:ghostly, "fg", "")
call <SID>X("StatusLineNC", s:ghostly, s:darkness, "")
call <SID>X("StorageClass", s:posh, "", "")
call <SID>X("Structure", s:finns_bag, "", "underline")
call <SID>X("Tag", s:red, "", "italic")
call <SID>X("Title", s:important, "", "")
call <SID>X("Todo", s:very_light_gray, "", "")

call <SID>X("Typedef", s:red, "", "italic")
call <SID>X("Type", s:red, "", "italic")
call <SID>X("Underlined", "", "", "underline")

call <SID>X("VertSplit", s:ghostly, s:darkness, "bold")
call <SID>X("VisualNOS", "", s:light_orange, "")
call <SID>X("Visual", "", s:light_orange, "")
call <SID>X("WarningMsg", s:very_light_gray, s:gray, "bold")
call <SID>X("WildMenu", s:finn_the_human, s:darkness, "")

call <SID>X("TabLineFill", s:darkness, s:darkness, "")
call <SID>X("TabLine", s:light_gray, s:darkness, "")
call <SID>X("Comment", s:light_gray, "", "")
call <SID>X("CursorLine", "", s:dark_gray, "")
call <SID>X("CursorLineNr", s:very_light_gray, s:very_dark_gray, "")
call <SID>X("CursorColumn", "", s:dark_gray, "")
call <SID>X("ColorColumn", "", s:dark_gray, "")
call <SID>X("LineNr", s:light_gray, s:darkness, "")
call <SID>X("NonText", s:gray, "", "")
call <SID>X("SpecialKey", s:gray, "", "")

" TODO: Add these codes.  But with Adventurous Colors
""" if s:molokai_original == 1
"""    hi Normal          guifg=#F8F8F2 guibg=#272822
"""    hi Comment         guifg=#75715E
"""    hi CursorLine                    guibg=#3E3D32
"""    hi CursorLineNr    guifg=#FD971F               gui=none
"""    hi CursorColumn                  guibg=#3E3D32
"""    hi ColorColumn                   guibg=#3B3A32
"""    hi LineNr          guifg=#BCBCBC guibg=#3B3A32
"""    hi NonText         guifg=#75715E
"""    hi SpecialKey      guifg=#75715E
""" else
"""    hi Normal          guifg=#F8F8F2 guibg=#1B1D1E
"""    hi Comment         guifg=#7E8E91
"""    hi CursorLine                    guibg=#293739
"""    hi CursorLineNr    guifg=#FD971F               gui=none
"""    hi CursorColumn                  guibg=#293739
"""    hi ColorColumn                   guibg=#232526
"""    hi LineNr          guifg=#465457 guibg=#232526
"""    hi NonText         guifg=#465457
"""    hi SpecialKey      guifg=#465457
""" end

delf <SID>X
delf <SID>XSP
delf <SID>ansi
