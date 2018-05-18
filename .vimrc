" Taylor Vance


set nocompatible	" no vi compatibility
set modelines=0		" prevents some security exploits

filetype off
execute pathogen#infect()
filetype plugin indent on

syntax on

let mapleader=","

set encoding=utf-8


" << UI >> {{{

colorscheme solarized		" use Ethan Schoonover's Solarized colorscheme
set background=dark			" use dark background (duh)
set number					" show line number of current line...
set relativenumber			" ...and relative line number of other lines
set cursorline				" highlight current line
set showcmd					" show prev cmd in bottom
set showmode				" if in Insert, Replace, or Visual mode, show in bottom left
set showmatch				" highlight matching bracket
set wrap					" visually wrap a line if it's wider than the window
set textwidth=0				" don't insert an actual <EOL> as I'm typing a long line
set linebreak				" don't break words when wrapping
set visualbell				" don't beep
set lazyredraw				" prevents redraw for macros, registers, and non-typed cmds
set mouse=a					" enable mouse in all modes
set clipboard=unnamedplus	" use the system clipboard

" << STATUSLINE >> {{{
set laststatus=2				" always show the status line
set statusline=					" make my own statusline
set statusline+=%1*\ %y%*		" file type
set statusline+=%2*\ \ %f%*		" relative filepath
set statusline+=%3*\ \ %m%*		" modified flag
set statusline+=%4*%=%*			" switch to right side
set statusline+=%5*[%c,%v]%*	" col num and virtual col num
set statusline+=%6*\ \ %l/%L%*	" line num and total lines
set statusline+=%7*\ (%p%%)%*	" percentage through file
" statusline coloring
highlight User1 ctermbg=0 ctermfg=8
highlight User2 ctermbg=0 ctermfg=7
highlight User3 ctermbg=0 ctermfg=9 cterm=bold
highlight User4 ctermbg=0
highlight User5 ctermbg=0 ctermfg=12
highlight User6 ctermbg=0 ctermfg=7
highlight User7 ctermbg=0 ctermfg=8
" }}}

" tabs are 4 columns wide, each indentation level is one tab
set tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab

" folding
set foldenable				" enable folding
set foldlevelstart=10		" fold very nested indents by default
set foldnestmax=5			" don't let us fold too many folds
set foldmethod=indent		" fold based on indent level
" toggle fold with space
nnoremap <space> za
" fold by marker for vim files
augroup filetype_vim
	autocmd!
	autocmd FileType vim setlocal foldmethod=marker
augroup END

" show invisible chars
set listchars=tab:▸\ ,trail:•,eol:¬
nnoremap <leader>l :set list!<cr>

" turn off number and gitgutter columns (useful for copying text to paste)
nnoremap <leader>nn :set nonumber norelativenumber<cr>:GitGutterDisable<cr>

" }}}


" << SEARCH >> {{{

set incsearch				" search as chars are entered
set wildmenu				" enhance cmd-line completion
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
	\ 'dir': '\.git$\|\.svn$\|bower_components$\|node_modules$\|vendor$\|glyphicons$'
	\ }

" cache CtrlP
let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp'

" }}}


" << NAVIGATION >> {{{

set scrolloff=3			" keep a 3-line padding above and below the cursor

" quicker tab traversal
nnoremap <C-l> gt
nnoremap <C-h> gT

" move cursor by display lines (helps when a line is visually wrapped)
nnoremap j gj
nnoremap k gk

" use tab instead of % to move to matching bracket
nnoremap <tab> %
vnoremap <tab> %

" go to beginning/end of line rather than the window (horizonal rather than vertical)
nnoremap H ^
nnoremap L $

" jump to git changes
nnoremap <up> :GitGutterPrevHunk<cr>
nnoremap <down> :GitGutterNextHunk<cr>

" }}}


" << EDITING >> {{{

set autoindent							" use the current line's indent
set backspace=indent,eol,start			" allow backspacing
set runtimepath+=~/.vim/my-snippets/	" make sure vim sees my custom snippets

nnoremap <leader>w :w<cr>
nnoremap <leader>q :q<cr>
nnoremap <leader>wq :wq<cr>

" hit j and k (order doesn't matter) to escape insert mode
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

" open a new line but stay in normal mode at current position
nnoremap <leader>o m`o<esc>S<esc>``
nnoremap <leader>O m`O<esc>S<esc>``

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

" insert current datetime in ISO format
inoremap <leader>dt <C-r>=strftime('%Y-%m-%d %H:%M:%S')<C-m>

" better line joins
if v:version > 703 || v:version == 703 && has('patch541')
	set formatoptions+=j
endif

" }}}


" << MISC >> {{{

set hidden			" a buffer becomes hidden when it's abandoned (w/e that means)
set ttyfast			" indicates fast terminal connection
set undofile		" persistent undo tree
set history=1000	" cmd-line history

" quickly edit and source vimrc
nnoremap <leader>ev :vsp $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" save a keystroke (shift) with every command (save, quit, etc)
nnoremap ; :

" make help docs open in vertical split
cnoreabbrev H vertical help

" make gitgutter less of a resource hog
"let g:gitgutter_realtime = 0
"let g:gitgutter_eager = 0
" ignore whitespace changes
let g:gitgutter_diff_args = '-w'

" }}}
