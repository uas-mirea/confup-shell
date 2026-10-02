#!/bin/sh

if [ $# -lt 1 ]; then
	echo "Please specify extension"
	exit 1
fi

extension="$1"
filename="$2"

if [ $# -lt 2 ]; then
	filename="archive.tar"
fi

tar -cf "$filename" *.$extension
