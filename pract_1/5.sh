#!/bin/sh

if [ `id -u` -ne 0 ]; then 
	echo "You need to be root"
	exit 1
fi

if [ $# -lt 1 ]; then
	echo "Please supply the software to install in an argument"
	exit 1
fi

software="$1"

if [ ! -f $software ]; then
	echo "File doesn't exist"
fi

cp "$software" /usr/local/bin
