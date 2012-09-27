#!/bin/sh

if [ "X$1" = "X" ]

then
	echo

	echo "Usage: $0 [pkgsrc] keyword"

	echo

	exit 1

elif [ "X$2" = "X" ]

then
	pkgsrc="/usr/pkgsrc"

	keyword="$1"
else
	pkgsrc="$1"

	keyword="$2"
fi

echo "$pkgsrc"/*/* \
| tr " " "\n" \
| grep -i "$keyword"
