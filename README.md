[![Build Status](https://travis-ci.org/Astro250/hwk1-ickc.svg?branch=master)](https://travis-ci.org/Astro250/hwk1-ickc)

# ASTRO 250 HW1

- usage: `./findit.sh <directory>`

- expects a sidecar of `.cat` file besides every `.fits` file. If the `.cat` file does not exist, return the corresponding `.fits` filenames in the stdout
- Notes:
    - `/usr/bin/env bash` is used to use the user's choice of bash rather than default bash
    - parameters: `*depth` to control how deep you want to search into
