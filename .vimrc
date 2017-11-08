" no vi compatibility
set nocompatible

filetype off
"call pathogen#runtime_append_all_bundles()
execute pathogen#infect()
filetype plugin indent on

syntax on

" prevents some security exploits
set modelines=0

" tab settings
set tabstop=4 shiftwidth=4 softtabstop=4 noexpandtab

set encoding=utf-8
set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=longest,list:full
set visualbell
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set number relativenumber
set undofile

let mapleader = ","

" don't use grep syntax when searching by default
nnoremap / /\v
vnoremap / /\v
" if search string is all lc, ignore case. else, case-sensitive.
set ignorecase smartcase
set gdefault
set incsearch showmatch hlsearch
" quicker than :noh
nnoremap <leader><space> :noh<cr>
" use tab instead of % to move to matching bracket pair
nnoremap <tab> %
vnoremap <tab> %

" disable arrow keys in normal mode
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>

" move cursor by display lines when a line is wrapped
nnoremap j gj
nnoremap k gk

" now we don't have to use shift to save, etc
nnoremap ; :

set wrap
set textwidth=79
set formatoptions=qrn1
"set colorcolumn=85

" show invisible chars
nmap <leader>l :set list!<CR>
"set list
set listchars=tab:▸\ ,eol:¬

" reselect pasted text
nnoremap <leader>v V`]

" use jj to quickly get from insert to normal
inoremap jj <ESC>

set mouse=a
set clipboard=unnamed

" maintain clipboard after pasting
xnoremap p "_dP
" stay in visual mode after tab shift
vnoremap < <gv
vnoremap > >gv
