EDITOR=nano

list=/tmp/list.txt

say () {

	echo -e "$1\n"

}

indent () {

	say "\t$1"

}

f () {
	file=$( head -1 $list )

	$EDITOR $file

	left
}

n () {

	sed '1d' $list > ${list}.edited

	mv ${list}.edited $list

	left

}

left () {

	remaining=`wc -l $list | awk '{ print $1 }'`;

	echo "$remaining matching files ";

}

files () {

	cat $list

}

search () {

	grep -i "$1" -R . \
	| tr ':' ' ' \
	| awk '{ print $1 }' \
	| uniq \
	> $list

	left

}

h () {

	echo

	say "Search the current directory"

	say "Type..."

	indent "\"search,\" followed by a keyword, to find matching files."

	indent "\"f\" to edit the current file."

	indent "\"n\" to move to the next result."

	indent "\"left\" to count the search results."

	indent "\"files\" to see results."

	indent "\"h\" for help."

	say "Search results are in $list."

}

h
