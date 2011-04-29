#!/bin/sh

info() { echo "$$ $*"; }
err() { echo "E: $$ $*" >&2; }

FILES="$(pwd -P)"
for x; do
	if [ -L "$x" ]; then
		err "$x: symlinks not supported"
	elif [ -d "$x" ]; then
		true
	else
		info "[$x]"
	fi
done
