#!/bin/sh

if [ $# -lt 1 ]; then
	echo "Please provide file"
	exit 1
fi

filename="$1"

grep -o "[A-Za-z_][A-Za-z0-9_]*" "$filename" | sort
