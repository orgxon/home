#!/bin/sh

exec > "$0.out"
exec 2>&1

set -e
exec "$(dirname "$0")/update.sh" ./sync.sh
