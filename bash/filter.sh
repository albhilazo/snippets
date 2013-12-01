## grep ##

# Filter out empty and commented (#) lines with or without tabs or spaces
egrep -v '(^#|^\s*$|^\s*\t*#)' $file

# Count lines ignoring spaces and empty lines
grep -c '[^[:space:]]' $file




## sed ##

# Replace 'str1' for 'str2' in a file
sed -i 's/str1/str2/g' $file

# Remove leading white spaces
sed 's/^ *//g'

# Remove trailing white spaces
sed 's/ *$//g'