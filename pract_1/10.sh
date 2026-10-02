#!/bin/sh

if [ $# -lt 1 ]; then
	echo "Directory not specified"
	exit 1
fi

dir="$1"

for file in $dir/*; do
	if [ ! -s "$file" ]; then
		basename $file
	fi
done
