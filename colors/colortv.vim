" Vim color file
" Maintainer:	Taylor Vance <vimcolors@tvprograms.technology>
" Last Change:	2018-06-15

set background=dark

hi clear
if exists("syntax_on")
  syntax reset
endif

let g:colors_name="colortv"

hi Normal ctermfg=White ctermbg=Black

hi Comment ctermfg=DarkGray
hi Constant ctermfg=Red
hi Identifier ctermfg=Blue
hi Operator ctermfg=LightBlue
hi PreProc ctermfg=Green
hi Statement ctermfg=Yellow
hi Type ctermfg=Yellow

"NR-16	NR-8	COLOR NAME
"0	    0	    Black
"1	    4	    DarkBlue
"2	    2	    DarkGreen
"3	    6	    DarkCyan
"4	    1	    DarkRed
"5	    5	    DarkMagenta
"6	    3	    Brown, DarkYellow
"7	    7	    LightGray, LightGrey, Gray, Grey
"8	    0*	    DarkGray, DarkGrey
"9	    4*	    Blue, LightBlue
"10	    2*	    Green, LightGreen
"11	    6*	    Cyan, LightCyan
"12	    1*	    Red, LightRed
"13	    5*	    Magenta, LightMagenta
"14	    3*	    Yellow, LightYellow
"15	    7*	    White
