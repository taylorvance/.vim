" Vim color file
" Maintainer:	Taylor Vance <vimcolors@tvprograms.technology>
" Last Change:	2018-06-15

hi clear
set background=dark

if exists("syntax_on")
  syntax reset
endif

let g:colors_name="colortv"

hi Normal     guifg=Black  guibg=White

hi Comment    cterm=NONE ctermfg=DarkGray
hi Constant   cterm=NONE ctermfg=DarkRed
hi Identifier cterm=NONE ctermfg=DarkGreen
hi PreProc    cterm=NONE ctermfg=DarkMagenta
hi Special    cterm=NONE ctermfg=LightRed
hi Statement  cterm=bold ctermfg=Yellow
hi Type	      cterm=NONE ctermfg=Blue
