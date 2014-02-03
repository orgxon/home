#!/bin/sh

TOOL="/usr/bin/${0##*/}"

set -e
if [ $# -ge 2 ]; then
	if [ "x-C" = "x$1" ]; then
		cd "$2"
		shift 2
	fi
fi
exec $TOOL "$@"
