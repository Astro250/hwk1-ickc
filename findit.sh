#!/bin/bash

# Here's an example code to play with/re-write to do the first homework assignment.
#
# In /project/projectdirs/astro250/data/hwk1 we have a set of fits files as well as catalogs
# from these fits files. They are named the same save for the suffix (.fits or .cat). 
# Some of the .cat files are missing. Write a bash shell script which takes as input 
# the directory name and prints out the names of the .fits files which are missing their 
# corresponding .cat files.
#

dir=$1

file=junk.fits

cd $dir

for i in *.*
do

  if [[ $i == $file ]]; then
    echo $file is in $dir
  fi

done

cd ..
