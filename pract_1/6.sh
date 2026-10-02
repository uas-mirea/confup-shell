#!/bin/sh

if [ $# -lt 1 ]; then
	echo "Please provide an argument";
	exit 1
fi

program=$1

if [ ! -f "$program" ]; then
	echo "File doesn't exist"
	exit 1
fi

first_line=`head -n1 "$program"`

case "$program" in
	*.py)
		case "$first_line" in
			\#*)
				echo "Commented"
				;;
			*)
				echo "Not commented"
				;;
		esac
		;;
	*.js|*.c)
		case "$first_line" in
			*/\**|//*)
				echo "Commented"
				;;
			*)
				echo "Not commented"
				;;
		esac
		;;
	*)
		echo "Don't know what to do"
		;;
esac
