# ~/.bashrc: executed by bash(1) for non-login shells.

export LANG="en_GB.UTF-8"

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# GPG
#
x="$HOME/.gpg-agent-info"
if ! type -p gpg-agent > /dev/null; then
	rm -f "$x"
elif test -s "$x" &&
	kill -0 $(cut -d: -f2 "$x" 2> /dev/null ) 2> /dev/null; then

	. "$x"
else
	eval $(gpg-agent --daemon --log-file "$HOME/.gpg-agent.log" \
		--write-env-file "$x" 2> /dev/null)

fi
if [ -s "$x" ]; then
	export GPG_TTY=$(tty)
	eval export $(cut -d= -f1 "$x")
fi
unset x

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

# better utf-8 support
export LESSCHARSET=utf-8

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
alias vi='vi "+set encoding=utf-8"'

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
