#!/bin/sh

set -e
cd "$(dirname "$0")"
DIR="$PWD"

cd "files"
find ! -type d -exec "$DIR/sync2.sh" '{}' \;

exec "$DIR/sync_ssh.sh"
