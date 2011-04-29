# $HOME/bin
#
if [ -d "$HOME/bin" ]; then
	export PATH="$HOME/bin:$PATH"
fi

# redirect bash to .bashrc (for `screen`)
if [ -n "$BASH_VERSION" ]; then
	if [ -s "$HOME/.bashrc" ]; then
		. "$HOME/.bashrc"
	fi
fi
