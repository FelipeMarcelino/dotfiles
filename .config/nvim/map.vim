let mapleader = " "

map <esc> :noh<CR>

" Return to last edited location
nnoremap <leader>l '.

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Saving file 
nnoremap <leader>w :w<CR>
nnoremap <C-s> :w<CR>
inoremap <C-s> :w<CR>
vnoremap <C-s> :w<CR>

" Quiting vim
noremap <C-q> :bd<CR>
nnoremap <leader>q :qa<CR>
nnoremap <leader>Q :qa!<CR>

" Down is really the next line
nnoremap j gj
nnoremap k gk

" Yank to end of the line
nnoremap Y y$

" Move to end of yanked text after yank and paste
nnoremap p p`]
vnoremap y y`]
vnoremap p py`]

" Move selected lines up and down
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

"Clipboard to vim
map <leader>p "+p
"Yank to Clipboard 
map <leader>y "+y

" Toggle between last 2 buffers
nnoremap <leader><tab> <C-^>

" Indenting in visual mode
xnoremap <s-tab> <gv
xnoremap <tab> >gv

" Remove ex-mode
map Q <nop>
map gq <nop>
map <M-Q> <nop>

nnoremap vs  :<C-u>split<CR>
nnoremap vv :<C-u>vsplit<CR>

" switch between current and last buffer
nmap <leader>. <c-^>


nnoremap n nzzzv
nnoremap N Nzzzv

