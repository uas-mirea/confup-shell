#!/bin/sh

if [ $# -lt 1 ]; then
	echo "Please provide directory"
	exit 1
fi

dir="$1"
files=`find "$dir" -type f`

for file_a in $files; do
	for file_b in $files; do
		if [ "$file_a" != "$file_b" ] && [ "`basename "$file_a"`" = "`basename "$file_b"`" ]; then
			echo "$file_a"
			break
		fi
	done
done
