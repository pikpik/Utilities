EDITOR=nano

list=/usr/tmp/list.txt


say () {

	echo -e "$1\n"

}

indent () {

	say "\t$1"

}

say ""

say "Type..."


indent "\"f\" to find the current result."

f () {
	file=$( head -1 $list )

	$EDITOR $file

	left
}


indent "\"n\" to move to the next result."

n () {

	sed '1d' $list > ${list}.edited

	mv ${list}.edited $list

	left

}


indent "\"left\" to count the search results."

left () {

	remaining=`wc -l $list | awk '{ print $1 }'`;

	echo "$remaining matching files ";

}


indent "\"search,\" followed by a keyword, to find matching files."

search () {

	grep -i "$1" -R /usr/src \
	| tr ':' ' ' \
	| awk '{ print $1 }' \
	| uniq \
	> $list

	left

}

say ""

say "Search results are in $list."
