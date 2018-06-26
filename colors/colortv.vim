" Vim color file
" Maintainer:	Taylor Vance <vimcolors@tvprograms.technology>
" Last Change:	2018-06-15

set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif

let g:colors_name="colortv"

" https://askubuntu.com/questions/821157/print-a-256-color-test-pattern-in-the-terminal

" White			255
" LightGray		247
" DarkGray		241
" Black			232

" Blue			39
" Green			47
" Purple		129
" Red			160
" Yellow		226

hi Normal ctermfg=255 ctermbg=232

hi Comment ctermfg=241
hi Constant ctermfg=160
hi Identifier ctermfg=39
hi Operator ctermfg=247
hi PreProc ctermfg=47
hi Statement ctermfg=129
hi Type ctermfg=226
