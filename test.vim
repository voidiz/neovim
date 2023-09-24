function! IncCommandToggle()
	let prev = &inccommand

	if &inccommand ==# 'split'
		set inccommand=nosplit
	elseif &inccommand ==# 'nosplit'
		set inccommand=split
	elseif &inccommand ==# ''
		set inccommand=nosplit
	else
		throw 'unknown inccommand'
	endif

	" return a change, to trigger redraw (:redraw doesn't work)
	" (the bug occurs without this - empty string also works)
	return " \<BS>"
endfunction

cnoremap <expr> <C-E> IncCommandToggle()