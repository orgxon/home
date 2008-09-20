set nocompatible

colorscheme koehler
set guifont=DejaVu\ Sans\ Mono\ 8

filetype indent on
syntax on

set nu!

if has("autocmd")
	" OpenSDE
	autocmd BufEnter *.in,*.conf,parse-config* set filetype=sh

	autocmd BufEnter *.h set filetype=c
endif
