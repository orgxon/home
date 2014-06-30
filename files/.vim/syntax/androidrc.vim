" Quit when a (custom) syntax file was already loaded
if exists("b:current_syntax")
	finish
endif

" case sensitive
syn case match

syn match  rcComment  "^[ \t]*#.*$"

hi link rcComment Comment

let b:current_syntax = "androidrc"
