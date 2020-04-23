runtime! defaults.vim

" unnamedplus: yank etc. uses the + register: XA_PRIMARY
" autoselect: visual selections go to * register: XA_SECONDARY
set clipboard=unnamedplus,autoselect,exclude:cons\|linux

" Use only the terminal's carefully selected ANSI colours for colour schemes.
" I am still permitted to use colours outside of that range.
if $TERM =~? "256color"
	set t_Co=16
endif

set hlsearch
set ignorecase
set smartcase

set background=dark

set listchars=trail:·,tab:>\ ,eol:¬

set number relativenumber
highlight LineNrBelow ctermfg=8
highlight LineNrAbove ctermfg=8


" vim-gitgutter
"
set updatetime=250

" ansi colours to match git diff
highlight GitGutterAdd    ctermfg=2
highlight GitGutterChange ctermfg=3
highlight GitGutterDelete ctermfg=1


" editorconfig
"
highlight ColorColumn ctermbg=234
let g:EditorConfig_max_line_indicator = "line"


" xterm-color-table
"
let g:XtermColorTableDefaultOpen = 'edit'
