#!/bin/bash
characterlimit=5
file=$(cat /home/kennedy/projects/countCharacters/5.tmp)

if [ ${#file} -ge "$characterlimit" ]; then
	#logger #add stuff here to report to ASWR
	printf "greater/equal to 5"
fi
