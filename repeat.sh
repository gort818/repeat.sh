#!/bin/bash

start=$(date +%s.%N)

if [ $# -ne 2 ]
	then
	echo "Wrong number of arguments." 1>&2
	echo "Usage: $0 <integer> <bash command * use quotation marks to encapsulate the command>" 1>&2
	exit 1


  else
	if  echo "$1" | grep '^[^1-9]$' > /dev/null 
		then
		echo "First argument must be an integer"
		exit 2 # not a valid integer 
	fi
fi
count=$1
echo "
	The command will be repeated $count times
     "

while [ $count -ge 1 ]
do
	($2)
	count=$(( count-1 ))
	
done
dur=$(echo "$(date +%s.%N) - $start" | bc)

printf "Execution time: %.6f seconds\n" $dur

