declare -A top


# Counting the times an entry appears
cat $input | while read entry
do
	if [ ${top[$entry]+_} ]
	then
		# Entry exists
		top[$entry]=$((top[$entry]+1))
	else
		# Entry doesn't exist
		top[$entry]=1
	fi
done


# Sort the list to output
for i in "${!top[@]}"
do
	echo $i :${top[$i]}
done | sort -nr -t : -k 2 >> $output

# Sort:
# 	-n	numeric
#	-r	reverse
#	-t	field separator
#	-k	key