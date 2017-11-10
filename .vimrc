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

set cursorline			" underline current line
set number				" precede each line with its line number
set relativenumber		" for each line except current, show number relative to current line
set ruler				" show cursor's line and column number
set lazyredraw			" prevents redraw when executing macros, registers, and non-typed commands
set showcmd				" show prev cmd in bottom
set showmatch			" highlight matching bracket
set showmode			" if in Insert, Replace, or Visual mode, show in bottom left
set wrap
set formatoptions=qrn1

" tabs are 4 columns wide, each indentation level is one tab
set tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab

" show invisible chars
set listchars=tab:▸\ ,eol:¬
nnoremap <leader>l :set list!<CR>


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

" CtrlP to open files in new buffers
let g:ctrlp_switch_buffer = 0


"----------------"
"-- NAVIGATION --"
"----------------"

set scrolloff=3

" quicker tab traversal
nnoremap <C-l> gt
nnoremap <C-h> gT

" move cursor by display lines when a line is wrapped
nnoremap j gj
nnoremap k gk

" use tab instead of % to move to matching bracket pair
nnoremap <tab> %
vnoremap <tab> %

" disable arrow keys in normal mode
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>




"//.pick up here

set autoindent
set hidden
set visualbell
set ttyfast
set backspace=indent,eol,start
set laststatus=2
set undofile
set history=1000
set mouse=a
set clipboard=unnamed
set gdefault

" now we don't have to use shift to save, etc
nnoremap ; :

" reselect pasted text
nnoremap <leader>v V`]

" use jj to quickly get from insert to normal
inoremap jj <ESC>

" NERDTree shortcut
nnoremap <leader>n :NERDTreeToggle<CR>
" close vim if NERDTree is the only thing open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" maintain clipboard after pasting
xnoremap p "_dP
" stay in visual mode after tab shift
vnoremap < <gv
vnoremap > >gv



" stuff for DT...this should probably live somewhere else

" Macros
"let @d = 'oecho(1&&isDev()?dt_dump($query):"");^[bb'
"let @c = 'dO/*^M*/^[P'

" Commands
" Open current page in container 8
"command Container :tabedit scp://10.0.6.152//var/www/html/container_8/%:p:.
