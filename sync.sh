#!/bin/sh

set -e
cd "files"
find ! -type d -exec ../sync2.sh '{}' \;

keys=
for x in $HOME/.ssh/*.pub; do
	if [ -s "$x" ]; then
		keys="$keys $x"
	else
		rm "$x"
	fi
done

ak="$HOME/.ssh/authorized_keys"
if [ -s "$ak" ]; then
	while read l; do
		found=
		for k in $keys; do
			read l2 < $k || true
			if [ "$l" = "$l2" ]; then
				found=yes
				echo "$l"
				break
			fi
		done

		if [ -z "$found" ]; then
			name="$(echo "$l" | cut -d' ' -f3)"
			if [ -n "$name" ]; then
				echo "$l" > .ssh/$name.pub
			fi
		fi
	done < $ak > $ak~
else
	touch $ak
	for x in amery@geeks.cl \
		amery@builder.geeks.cl \
		amery@shell.easy-cloud.net; do
		cat .ssh/$x.pub
	done > $ak~
fi
if ! cmp $ak $ak~; then
	diff -u $ak $ak~ || true
	mv $ak~ $ak
fi
cd ..
git status --porcelain
