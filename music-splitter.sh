#!/bin/bash

# Requires two arguments. 
# Creates a directory for the first argument, then moves ALL matching files into that directory.

category='(?<='
category+=$1
category+=':    ).*'

criteria=$2

mkdir "$criteria"

while IFS= read -d $'\0' -r file ; do  # Iterate through current directory
	# Clean off filename (after ./)
	name=$(echo '%s' "$file" | grep -oP '(?<=/).*')
	# Get mp3 (specifically the latest version of the tags, V2.4) metadata 
	genre=$(id3show "$name" | grep -oP "$category")
	# Clean color characters off
	genre=$(echo "$genre" | sed 's/\x1B\[[0-9;]\{1,\}[A-Za-z]//g' )
	
	# Test if the genre is what we're searching for.
	if [[ "$criteria" == "$genre" ]]; then
		echo "found target: " "$name"
		# Move
		mv "$file" "$criteria"
	fi
done < <(find . -print0)

