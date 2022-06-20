#!/bin/sh

set -eu
git submodule update --init
./sync.sh
git reset --hard
