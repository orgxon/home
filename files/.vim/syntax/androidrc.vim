" Quit when a (custom) syntax file was already loaded
if exists("b:current_syntax")
	finish
endif

" case sensitive
syn case match

syn match  rcComment  "^[ \t]*#.*$"
syn match  rcProperty "\${[a-z\.]\+}"

hi link rcComment Comment
hi link rcProperty Identifier

let b:current_syntax = "androidrc"
