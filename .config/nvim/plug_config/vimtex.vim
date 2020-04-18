let g:vimtex_enable = 1
let g:tex_flavor='latex'
" Backward sync with neovim-remote and tex
let g:vimtex_compiler_progname = 'nvr'

" Main file vimtex
autocmd BufReadPre *.tex let b:vimtex_main = 'main.tex'

" Zathura viewer
let g:vimtex_view_method = 'zathura'

let g:vimtex_complete_close_braces = 1
 
let g:vimtex_complete_bib_simple = 1

