" Quit when a (custom) syntax file was already loaded
if exists("b:current_syntax")
	finish
endif

" case sensitive
syn case match

syn match scrComment "^[ \t]*#.*$"
syn match scrProperty "\${[a-z\.]\+}"

hi link scrComment Comment
hi link scrProperty Identifier

let b:current_syntax = "uboot"
