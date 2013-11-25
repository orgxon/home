#!/bin/sh

cd "$(dirname "$0")"

if [ "$(git ls-files -mdo)" ]; then
	updated=true
	git stash -q
else
	updated=false
fi

echo "== $PWD =="
git pull -q --rebase

if $updated; then
	git stash pop -q
fi

[ $# -eq 0 ] || exec "$@"
