
" Toggle numbers relative normal when insert and normal
augroup numbertoggle
	autocmd!
	autocmd BufEnter, FocusGained, InsertLeave, WinEnter	* if &nu | set rnu	| endif
	autocmd BufLeave, FocusLost, InsertEnter, WinLeave	* if &nu | set nornu	| endif
augroup END

" Return to last edit position when opening files
au BufReadPost * if line("'\"") > 1 &&  line("'\"")  <= line("$") | exe "normal! g'\"" | endif

" Autosave when focus lost
au FocusLost * silent! :wa

