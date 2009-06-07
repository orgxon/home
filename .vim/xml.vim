set ts=4
set sw=4

" make invisible errors, very visible
"
" no trailing whitespacing, no spaces at the begging of the line.
" and no tabs after spaces.
syn match WrongWhitespace /\s\+$\|^ \+\| \+\t/

" no more than 7 spaces for aligning
"
" NOTE: aligning after `int ab(` would break this rule, as 6 or 7
" spaces would be needed without a previous tab. but two letters
" as a function name, please don't.
syn match WrongWhitespace /\t \{8,}/

"match WrongWhitespace / \+\ze\t/ " what is this?

highlight WrongWhitespace ctermbg=red guibg=red
