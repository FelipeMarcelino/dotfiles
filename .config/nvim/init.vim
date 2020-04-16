if has ('nvim')
	let g:vimdir = "~/.config/nvim"
else
	let g:vimdir = "~/.vim"
endif

exec "source" . g:vimdir . "/general.vim"
exec "source" . g:vimdir . "/plug.vim"
exec "source" . g:vimdir . "/map.vim"
exec "source" . g:vimdir . "/function.vim"


" Folder for plugins setting
for f in split(glob(g:vimdir . '/plug_config/*.vim'), '\n')
    exec "source " f
endfor

" Make an undo directory if it does not exist
if !isdirectory($HOME . "/.undo")
    call mkdir($HOME . "/.undo", "p")
endif


exec "source" . g:vimdir . "/post_fix.vim"
