#!/bin/sh

info() { echo "$$: $*"; }
err() { echo "E: $$: $*" >&2; }

FILES="$(pwd -P)"
for x; do
	if [ -L "$x" ]; then
		err "$x: symlinks not supported"
	elif [ -d "$x" ]; then
		true # skip dirs
	elif [ -L "$HOME/$x" ]; then
		d0="$(readlink "$HOME/$x")"
		d1="$(echo "$FILES/$x" | sed -e 's,/\./,/,g')"
		if [ "$d0" != "$d1" ]; then
			err "$x: relinking, was [$d0]"
			ln -snf "$d1" "$HOME/$x"
		fi
	else
		d="$(dirname "$x")"
		if [ ! -d "$HOME/$d/" ]; then
			info "$d: creating dir"
			mkdir -p "$HOME/$d/"
		fi

		d="$(echo "$FILES/$x" | sed -e 's,/\./,/,g')"
		if [ -e "$HOME/$x" ]; then
			info "$x: importing changes and linking"
			cp -a "$HOME/$x" "$d"
		else
			info "$x: linking"
		fi
		ln -snf "$d" "$HOME/$x"
	fi
done