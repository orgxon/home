#!/bin/sh

set -eu
./sync.sh
git reset --hard
