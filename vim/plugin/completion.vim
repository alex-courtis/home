" omnicompletion
"   inspired by https://vim.fandom.com/wiki/Make_Vim_completion_popup_menu_work_just_like_in_an_IDE
"
set completeopt=menuone,longest

ino	<expr>	<C-@>		OmniBegin()
ino	<expr>	<C-x><C-o>	OmniBegin()
ino	<expr>	<CR>		OmniMaybeSelectFirstAndAccept()
ino	<expr>	<Tab>		pumvisible() ? "\<C-n>" : "\<Tab>"
ino	<expr>	<S-Tab>		pumvisible() ? "\<C-p>" : "\<S-Tab>"

autocmd CompleteDone * call OmniEnd()

" turn off ignore case, as mixed case matches result in longest length 0
function! OmniBegin()
	set noignorecase
	let w:OmniCompleting=1
	return "\<C-x>\<C-o>"
endfunction

" turn on ignore case
function! OmniEnd()
	set ignorecase
	let w:OmniCompleting=0
endfunction

function! OmniMaybeSelectFirstAndAccept()
	if exists('w:OmniCompleting') && w:OmniCompleting && pumvisible()
		let ci=complete_info()
		if !empty(ci) && !empty(ci.items)
			if ci.selected == -1
				return "\<C-n>\<C-y>"
			else
				return "\<C-y>"
			endif
		endif
	endif
	return "\<CR>"
endfunction

