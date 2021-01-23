#!/bin/sh

set -e
cd "$(dirname "$0")"

find -H files -print0 | xargs -r0 "$PWD/sync2.sh" -d "files"

exec "$PWD/sync_ssh.sh"
