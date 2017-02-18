#!/usr/bin/env bash

# usage: ./findit.sh FOLDER
# expects a sidecar of .cat file besides every .fits file. If the .cat file does not exist, return the corresponding .fits filenames in the stdout
# Notes:
# /usr/bin/env bash is used to use the user's choice of bash rather than default bash
# parameters:
# *depth to control how deep you want to search into

FOLDER="$1"

if [[ ! -d "$FOLDER" ]]; then
  printf "%s\n" "$FOLDER is not a directory or does not exist."
  exit 1
fi

find "$FOLDER" -maxdepth 1 -mindepth 1 -name "*.fits" -exec bash -c '
  for fitsFile do
    expectedFile="${fitsFile%.*}.cat"
    if [[ ! -e "$expectedFile" ]]; then
      printf "%s\n" "$fitsFile"
    fi
  done' bash {} +
