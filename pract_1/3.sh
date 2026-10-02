#!/bin/sh

banner_tb() {
	echo -n "+"
	for i in `seq -1 $message_length`; do
		echo -n "-";
	done
	echo "+"
}

message="$1"
message_length=`echo -n "${message}" | wc -m`

banner_tb
echo "| $message |"
banner_tb
