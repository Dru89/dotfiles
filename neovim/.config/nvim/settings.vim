let vimsettings = "~/.config/nvim/settings"
let vimlocal = "~/.config/nvim/local"
let uname = system("uname -s")

for fpath in split(globpath(vimlocal, '*.vim'), '\n')
    exe 'source' fpath
endfor

for fpath in split(globpath(vimsettings, '*.vim'), '\n')
    if (fpath == expand(vimsettings) . '/z-keymap-mac.vim') && uname[:5] !=? "Darwin"
        continue " skip mac mappings for non-mac
    endif

    if (fpath == expand(vimsettings) . '/z-keymap-linux.vim') && uname[:4] !=? "linux"
        continue " skip linux settings for non-linux
    endif
    
    " TODO: windows?

    exe 'source' fpath
endfor
