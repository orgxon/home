set textwidth=95
set cinoptions=(0:0

" C99 keywords
syn keyword cType uint64_t uint32_t uint16_t uint8_t bool
syn keyword cType int64_t int32_t int16_t int8_t
" Linux keywords
syn keyword cType __u64 __u32 __u16 __u8
syn keyword cType u64 u32 u16 u8
syn keyword cOperator likely unlikely

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

highlight WrongWhitespace ctermbg=gray guibg=gray
