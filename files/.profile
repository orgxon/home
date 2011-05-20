# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.

# redirect bash to .bashrc (for `screen`)
if [ -n "$BASH_VERSION" ]; then
	if [ -s "$HOME/.bashrc" ]; then
		. "$HOME/.bashrc"
	fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ]; then
	export PATH="$HOME/bin:$PATH"
fi
