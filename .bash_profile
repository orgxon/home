#!/bin/sh

echo ".bash_profile -> .bashrc" >&2
[ -s "$HOME/.bashrc" ] && source "$HOME/.bashrc"
