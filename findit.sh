#!/usr/bin/env bash

# usage: ./findit.sh FOLDER
# expects a sidecar of .cat file besides every .fits file. If the .cat file does not exist, return the expected filenames in the stdout
# Notes:
# /usr/bin/env bash is used to use the user's choice of bash rather than default bash
# find with -print0 and xargs -0 option in case of poorly namely filenames. See man page. Newer GNU find and xargs only.
# parameters:
# *depth to control how deep you want to search into
# -pN flag: N is the maxmium no. of processes at a time.

find "$1" -maxdepth 1 -mindepth 1 -name "*.fits" -print0 | xargs -0 -i -n1 -P8 bash -c 'expectedFile="${0%.*}.cat"; if [[ ! -e "$expectedFile" ]]; then printf "%s\n" "$expectedFile"; fi' {}
