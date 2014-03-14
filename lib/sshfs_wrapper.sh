#!/bin/sh

set -e

die() {
	echo "$*" >&2
	exit 1
}

N="$(basename "$0")"
case "$N" in
sshfs_*)
	M=sshfs
	N="${N#sshfs_}"
	case "$N" in
	inmep)
		R=amery@inmep.geeks.cl:projects/
		;;
	builder)
		R=amery@geeks.cl:projects/
		;;
	*)
		R=$N:
		;;
	esac
	;;
flickr)
	M="${N}fs"
	;;
*)
	die "$0: invalid name"
	;;
esac

D="/media/$USER/$N"
if [ ! -d "$D/" ]; then
	sudo mkdir -p "$D"
	sudo chown $USER:$USER "$D"
fi

case "$M" in
sshfs)
	exec "$M" "$R" "$D"
	;;
flickrfs)
	exec "$M" "$D"
	;;
*)
	die "$M: invalid mode"
	;;
esac
