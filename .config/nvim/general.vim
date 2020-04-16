augroup vimrc
	autocmd!
	autocmd BufWritePre /tmp/* setlocal noundofile
augroup END


set background=dark " For theme
set nocompatible " not necessary in nvim
syntax enable " Syntax for languages 
filetype plugin on " Auto dectec filetype

" FINDING FILES:
" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**

set textwidth=120
set history=1000
set relativenumber 
set number

set ruler		" show the cursor position all the time
set title "Change the terminal's title

set showcmd "Show incomplete cmds down the bottom
set noshowmode "Hidee showmode because powerline plugin


set updatetime=300 "Cursor hold timeout

set noswapfile "No swap file, it is boring
set nobackup "No backup, it is boring
set nowritebackup "No write backup
set autoread "Autoread when files changes
set hidden "Hide buffers in background

" Enconding 

set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8


" Fix backspace indent
set backspace=indent,eol,start

" Tabs. May be overriten by autocmd rules
set smarttab " tab respects 'tabstop', 'shiftwidth', and 'softtabstop'
set tabstop=4 " the visible width of tabs
set softtabstop=4 " edit as if the tabs are 4 characters wide
set shiftwidth=4 " number of spaces to use for indent and unindent
set shiftround " round indent to a multiple of 'shiftwidth'
set expandtab

" Undo sets
set undodir=$HOME/undo " Set the undo directory
set undofile " Turn on persistent undo
set undoreload=10000

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase
set nolazyredraw " don't redraw while executing macros

set nostartofline "Jump to the first non blank character
set scrolloff=8 "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=5

set noerrorbells "No sound when errors happens
set novisualbell "No blinking screen when errors happens
set cursorline "A different color for cursor position

set wildmode=list:full
set wildignore=.o,.obj,*~         "stuff to ignore when tab completing
set wildignore+=.git
set wildignore+=.meteor
set wildignore+=vim/backups
set wildignore+=sass-cache
set wildignore+=cache
set wildignore+=logs
set wildignore+=node_modules/*
set wildignore+=DS_Store
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=.png,.jpg,*.gif
set shortmess+=c " don't give |ins-completion-menu| messages.

set signcolumn=yes " always show signcolumns
set showtabline=2
set laststatus=2


" code folding settings
set foldmethod=syntax " fold based on indent
set foldlevelstart=99
set foldnestmax=10 " deepest fold is 10 levels
set nofoldenable " don't fold by default
set foldlevel=1

set breakindent "Maintain line indent after break
set smartindent "Smart indent
set autoindent "Auto indent

set splitright "Split to right
set splitbelow "Split to down
set inccommand=nosplit

set clipboard=unnamed

set wrap
set linebreak " set soft wrapping
"let &showbreak = '↳ '
let &showbreak= '↪ '

set diffopt+=vertical,iwhite,internal,hiddenoff 
set shell=$SHELL
set showmatch 
set shortmess+=c

set list
set listchars=tab:→\ ,eol:¬,trail:⋅,extends:❯,precedes:❮

set gdefault "Set global flag for search and replace

cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall

execute "set t_8f=\e[38;2;%lu;%lu;%lum"
execute "set t_8b=\e[48;2;%lu;%lu;%lum"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

if (has("termguicolors"))
 set termguicolors
 let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
 let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

" Making the active window in vim more obvios
augroup BgHighlight
    autocmd!
    autocmd WinEnter * set cul
    autocmd WinLeave * set nocul
augroup END

" Ruby gem
let g:ruby_host_prog = '/home/felipemarcelino/.gem/ruby/2.7.0/bin/neovim-ruby-host'


