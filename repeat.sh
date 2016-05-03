!/bin/bash
# Simple bash script to allow one to run a command multiple times
# The first argument is the amount of this you would like the command to run.
# The second argument is the command you would like to run.

start=$(date +%s.%N)



if [[ $1 = *[!0-9]* ]];
		then
		echo "First argument must be an integer"
		exit 2 # not a valid integer 
  


fi


count=$1
printf "\nThe command will be repeated $count times\n\n"

shift

while [ $count -ge 1 ]
do
	 
	"$@"
	count=$(( count-1 ))
	
done
dur=$(echo "$(date +%s.%N) - $start" | bc)

printf "Execution time: %.6f seconds\n" $dur
