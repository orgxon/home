# ~/.bashrc: executed by bash(1) for non-login shells.

export LANG="en_GB.UTF-8"

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# GPG
#
if ! type -p gpg-agent > /dev/null; then
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

# debian/ubuntu development
#
export DEBFULLNAME="Alejandro Mery"
export DEBEMAIL="amery@geeks.cl"

# other apps chosen by env
#
export BROWSER=links
export EDITOR=vim

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# support resize, please
shopt -s checkwinsize

# standarise $TERM
case "$TERM" in
	nxterm)
		export TERM=xterm
		;;
	screen-256color|screen|xterm|rxvt|linux)
		;;
	*)
		echo "$TERM: Unknown TERM value."
		;;
esac

# get a nicer $PS1
[ -s $HOME/.bash/prompt.in ] && . $HOME/.bash/prompt.in

# aliases
#
alias ls='ls --color=auto'
alias l='ls -avhlF'
alias gdb='gdb -quiet'

[ "$(type -t ll)" = alias ] && unalias ll
function ll() { ls -avhlF $* | less; }

# vi mode
set -o vi

# local settings
for x in .bash/local.in /etc/bash_completion; do
	expr "$x" : / > /dev/null || x="$HOME/$x"
	 
	if [ -s "$x" ]; then
		. "$x"
	fi
done
