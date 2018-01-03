" Taylor Vance


set nocompatible	" no vi compatibility
set modelines=0		" prevents some security exploits

filetype off
execute pathogen#infect()
filetype plugin indent on

syntax on

let mapleader=","			" easier than backslash

set encoding=utf-8


" -- UI -- {{{

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
set textwidth=0				" don't automatically insert an actual <EOL> as I type a long line
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
" fold by marker for vim files
augroup filetype_vim
	autocmd!
	autocmd FileType vim setlocal foldmethod=marker
augroup END

" toggle background dark/light
map <leader>bg :let &background = (&background=="dark" ? "light" : "dark")<CR>

" show invisible chars
set listchars=tab:▸\ ,trail:•,eol:¬
nnoremap <leader>l :set list!<CR>

" turn off number and gitgutter columns (useful for copying text to paste)
nnoremap <leader>nn :set nonumber norelativenumber<CR>:GitGutterDisable<CR>

" }}}


" -- SEARCH -- {{{

set incsearch				" search as chars entered
set hlsearch				" highlight matches
set wildmenu				" enhance command-line completion
set wildmode=list:longest	" list all matching and complete til longest common string
set ignorecase smartcase	" if search string is all lc, ignore case. else, case-sensitive.

" quickly clear highlighted search terms
nnoremap <leader><space> :noh<cr>

" search by plain text (very nomagic: only \ has special meaning)
nnoremap / /\V

" open CtrlP files in new tab by default
let g:ctrlp_prompt_mappings = {
	\ 'AcceptSelection("e")': ['<c-t>'],
	\ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
	\ }

" CtrlP should ignore certain directories
let g:ctrlp_custom_ignore = {
	\ 'dir': '\.git$\|\.svn$\|bower_components$\|node_modules$\|vendor$'
	\ }

" cache CtrlP
let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp'

" }}}


" -- NAVIGATION -- {{{

set scrolloff=3			" keep a 3-line padding above and below the cursor

" quicker tab traversal
nnoremap <C-l> gt
nnoremap <C-h> gT
" disable old way to break the habit
nnoremap gt <nop>
nnoremap gT <nop>

" move cursor by display lines (helps when a line is visually wrapped)
nnoremap j gj
nnoremap k gk

" use tab instead of % to move to matching bracket
nnoremap <tab> %
vnoremap <tab> %

" go to beginning/end of line rather than the window (horizonal rather than vertical)
nnoremap H ^
nnoremap L $

" }}}


" -- EDITING -- {{{

set autoindent							" copy the current line's indent when starting a new one
set backspace=indent,eol,start			" allow backspacing over autoindent, line breaks, and the start of insert
set runtimepath+=~/.vim/my-snippets/	" make sure vim sees my custom snippets

" hit j and k (order doesn't matter) to escape insert mode
" note: we can't disable esc (by mapping to <nop>) because it causes problems
inoremap jk <ESC>
inoremap kj <ESC>

" stay in visual mode after left or right shift
vnoremap [ <gv
vnoremap ] >gv

" make Y behave like C and D (yank from cursor to EOL)
nnoremap Y y$

" maintain clipboard after pasting over something in visual mode
xnoremap p "_dP

" highlight last-pasted text
nnoremap <leader>v V`]

" highlight last-inserted text
nnoremap <leader>V `[v`]

" open a new line but stay in normal mode at the beginning of the current line
nnoremap <leader>o o<esc>-
nnoremap <leader>O O<esc>+

" If the unnamed register contains a newline, adjust indent of the pasted text to match the indent around it.
" Else, do a normal paste.
function! MyPaste(char)
	if a:char ==? "p"
		if matchstr(@", "\n") == "\n"
			execute "normal! " . a:char . "=']"
		else
			execute "normal! " . a:char
		endif
	endif
endfunction
nnoremap <leader>p :call MyPaste("p")<cr>
nnoremap <leader>P :call MyPaste("P")<cr>

" quickly begin todo comment
inoremap <leader>td //TODO: 

" insert current datetime in format: Y-m-d H:M:S
inoremap <leader>dt <C-r>=strftime("\%F \%T")<C-m>

" better line joins
if v:version > 703 || v:version == 703 && has('patch541')
	set formatoptions+=j
endif

" }}}


" -- MISC -- {{{

set hidden
set ttyfast
set undofile
set history=1000
set gdefault

" quickly edit and load vimrc
nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
" automatically source vimrc when it's saved
augroup save_vimrc
	autocmd!
	autocmd BufWritePost .vimrc source $MYVIMRC
augroup END
" clear the highlight when vimrc is reloaded
noh

" save a keystroke (shift) with every command (save, quit, etc)
nnoremap ; :

" make help docs open in vertical split
cnoreabbrev H vertical help

" NERDTree shortcut
nnoremap <leader>n :NERDTreeToggle<CR>
" close vim if NERDTree is the only thing open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" make gitgutter less of a resource hog
let g:gitgutter_realtime = 0
let g:gitgutter_eager = 0

" }}}



" stuff for DT...this should probably live somewhere else
" Open current page in container 8
command! C8 :tabedit scp://10.0.6.152//var/www/html/container_8/%:p:.
