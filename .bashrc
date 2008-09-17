export LANG="en_GB.UTF-8"
echo ".bashrc: TERM:$TERM ${PS1:+INTERACTIVE}" >&2

# $HOME/bin
#

if [ ! -d "$HOME/bin" ]; then
	set -x
	mkdir "$HOME/bin"
	if [ "$PATH" == "${PATH//$HOME\/bin/}" ]; then
		export PATH="$HOME/bin:$PATH"
	fi
	set +x
fi

# GPG
#
if [ ! -x "$(type -p gpg-agent)" ]; then
	:
elif test -f "$HOME/.gpg-agent-info" &&
		kill -0 $(cut -d: -f2 "$HOME/.gpg-agent-info" 2> /dev/null ) 2> /dev/null; then

	. "$HOME/.gpg-agent-info"

	export GPG_TTY=$(tty)
else
	eval $(gpg-agent --daemon --log-file "$HOME/.gpg-agent.log" \
		--write-env-file "$HOME/.gpg-agent-info" 2> /dev/null)

	export GPG_TTY=$(tty)
fi

# ssh wrapper
#
if [ -s "$HOME/bin/ssh" ]; then
	SSH="$HOME/bin/ssh"
else
	SSH=ssh
fi

for x in GIT_SSH; do
	eval export $x=$SSH
done

# other apps chosen by env
#
export BROWSER=links
export EDITOR=vim

# tweak your bash
#
export HISTFILESIZE=50
export HISTCONTROL=ignoredups

# interactive prompt
if [ -n "$PS1" ]; then
	# support resize, please
	shopt -s checkwinsize

	# get a nicer $PS1
	[ -s $HOME/.bash/prompt.in ] && . $HOME/.bash/prompt.in

	# aliases
	#
	alias ls='ls --color=auto'
	alias l='ls -avhlF'

	[ "$(type -t ll)" = alias ] && unalias ll
	function ll() { ls -avhlF $* | less; }
fi

# local settings
[ -s $HOME/.bash/local.in ] && . $HOME/.bash/local.in
