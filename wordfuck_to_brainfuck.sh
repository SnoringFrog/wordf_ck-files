#!/usr/bin/env bash
# Converts a wordfuck program into a brainfuck program.
# TODO: Accept argument to keep or discard words that are out of range, and to keep or discard punctuation (issue: commas and periods screw stuff up if left in and not wanted).
bf=""
for word in $(<$1)
do
	word=`echo "$word" | sed 's/[^a-zA-Z]//g'`
	len=${#word}

	case "$len" in
		2)
			bf+="."	
			;;
		3)
			bf+="-"
			;;
		4)
			bf+="+"
			;;
		5)
			bf+=","
			;;
		6)
			bf+=">"
			;;
		7)
			bf+="<"
			;;
		8)
			bf+="["
			;;
		9)
			bf+="]"
			;;
		*)
			bf+=$word
	esac
done
echo "$bf"
