"Vista
let s:enabled = 0

function! ToggleVista()
if s:enabled
	:Vista nvim_lsp
	let s:enabled = 0
else
	:Vista!!
	let s:enabled = 1
endif
endfunction

