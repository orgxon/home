#!/bin/sh

set -e
cd "files"
exec find ! -type d -exec ../sync2.sh '{}' \;
