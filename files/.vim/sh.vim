syn match WrongWhitespace /\s\+$\|^ \+\|\t \+\| \+\t/
syn match WrongWhitespace /\t \{8,}/

highlight WrongWhitespace ctermbg=gray guibg=gray
