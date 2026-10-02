#!/bin/sh

if [ $# -lt 2 ]; then
	echo "Please specify input and output file"
	exit 1
fi

input="$1"
output="$2"

sed "s/    /\t/g" "$input" > "$output"
