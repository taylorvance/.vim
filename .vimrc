" Taylor Vance

set nocompatible	" no vi compatibility

set modelines=0		" prevents some security exploits

filetype off
execute pathogen#infect()
filetype plugin indent on

syntax on

let mapleader = ","

set encoding=utf-8


"--------"
"-- UI --"
"--------"

set background=dark			" use dark background (duh)
colorscheme solarized		" use Ethan Schoonover's Solarized colorscheme
set number					" precede each line with its line number
set relativenumber			" for each line except current, show number relative to current line
set cursorline				" highlight current line
set ruler					" show cursor's line and column number
set laststatus=2			" always show the status line
set showcmd					" show prev cmd in bottom
set showmode				" if in Insert, Replace, or Visual mode, show in bottom left
set showmatch				" highlight matching bracket
set wrap					" visually wrap a line if it's wider than the window
set linebreak				" don't break words when wrapping
set visualbell				" don't beep
set lazyredraw				" prevents redraw when executing macros, registers, and non-typed commands
set mouse=a					" enable mouse in all modes
set clipboard=unnamedplus	" use the system clipboard

" tabs are 4 columns wide, each indentation level is one tab
set tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab

" folding
set foldenable				" enable folding
set foldlevelstart=10		" fold very nested indents (10 deep) by default
set foldnestmax=10			" don't let us fold too many folds
set foldmethod=indent		" fold based on indent level
" toggle fold with space
nnoremap <space> za

" toggle background dark/light
map <Leader>bg :let &background = (&background=="dark" ? "light" : "dark")<CR>

" show invisible chars
set listchars=tab:▸\ ,eol:¬
nnoremap <leader>l :set list!<CR>

" highlight last-pasted text
nnoremap <leader>v V`]

" highlight last-inserted text
nnoremap gV `[v`]

" stay in visual mode after tab shift
vnoremap < <gv
vnoremap > >gv


"------------"
"-- SEARCH --"
"------------"

set incsearch				" search as chars entered
set hlsearch				" highlight matches
set wildmenu				" enhance command-line completion
set wildmode=list:longest	" list all matching and complete til longest common string
set ignorecase smartcase	" if search string is all lc, ignore case. else, case-sensitive.

" quickly clear highlighted search terms
nnoremap <leader><space> :noh<cr>

" don't use grep by default when searching
nnoremap / /\v
vnoremap / /\v

" open CtrlP files in new tab by default
let g:ctrlp_prompt_mappings = {
	\ 'AcceptSelection("e")': ['<c-t>'],
	\ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
	\ }


"----------------"
"-- NAVIGATION --"
"----------------"

set scrolloff=3			" keep a 3-line padding above and below the cursor

" quicker tab traversal
nnoremap <C-l> gt
nnoremap <C-h> gT

" move cursor by display lines (helps when a line is wrapped)
nnoremap j gj
nnoremap k gk

" use tab instead of % to move to matching bracket pair
nnoremap <tab> %
vnoremap <tab> %


"----------"
"-- MISC --"
"----------"

set autoindent		" copy the current line's indent when starting a new one
set hidden
set ttyfast
set backspace=indent,eol,start
set undofile
set history=1000
set gdefault

" quickly edit and load vimrc
nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

" save a keystroke (shift) with every command (save, quit, etc)
nnoremap ; :

" use jj to quickly get out of insert mode
inoremap jj <ESC>

" NERDTree shortcut
nnoremap <leader>n :NERDTreeToggle<CR>
" close vim if NERDTree is the only thing open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" maintain clipboard after pasting
xnoremap p "_dP



" stuff for DT...this should probably live somewhere else

" Macros
let @d = 'oecho(1&&isDev()?dt_dump($query):"");jjbb'
"let @c = 'dO/*^M*/^[P'

" Commands
" Open current page in container 8
"command Container :tabedit scp://10.0.6.152//var/www/html/container_8/%:p:.
