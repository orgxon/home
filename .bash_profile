if [ -s "$HOME/.bashrc" ]; then
	echo ".bash_profile:  -> .bashrc" >&2
	. "$HOME/.bashrc"
fi
