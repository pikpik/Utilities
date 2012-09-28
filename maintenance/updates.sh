#!/bin/sh

src=/usr/src


if [ "X$1" != "X" ]

then src="$1"

fi


(

	cd $src

	git fetch origin

	git log \
		origin/master...master \
		--pretty=format:"%cr - %s (%h)" \

) | awk '
	BEGIN {
		print ""
	}

	{
		print $0
	}

	END {
		print ""
		print "\t" NR ( NR == 1 ? " update" : " updates" )
		print ""
		print "To update: git pull"
		print ""
	}
'