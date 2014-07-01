" Quit when a (custom) syntax file was already loaded
if exists("b:current_syntax")
	finish
endif

if !exists("u_boot_highlight_cpp")
	let u_boot_highlight_cpp = 1
endif

" case sensitive
syn case match

syn match scrProperty "\${[a-z\._]\+}"

if u_boot_highlight_cpp != 0
	syn match cppHash "^[ \t]*#.*$"
	syn match cppLineComment "\/\/.*"
	syn region cppComment	start="/\*" end="\*/"

	hi link cppHash PreProc
	hi link cppLineComment Comment
	hi link cppComment Comment
else
	syn match scrComment "^[ \t]*#.*$"
	hi link scrComment Comment
endif

hi link scrProperty Identifier

let b:current_syntax = "uboot"
