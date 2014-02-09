#!/bin/sh

set -e
N="$(basename "$0")"
N="${N#sshfs_}"
case "$N" in
inmep)
	R=amery@inmep.geeks.cl:projects/
	;;
builder)
	R=amery@geeks.cl:projects/
	;;
*)
	echo "$0: invalid name" >&2
	exit 1
	;;
esac
D="/media/$USER/$N"
if [ ! -d "$D/" ]; then
	sudo mkdir -p "$D"
	sudo chown $USER:$USER "$D"
fi
exec sshfs "$R" "$D"
