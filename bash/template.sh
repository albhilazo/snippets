#!/bin/bash

############################################################
##    @author     Albert Hilazo                           ##
##    @version    1.0.0                                   ##
##                                                        ##
##    Description                                         ##
##                                                        ##
##    Syntax: .sh <parameters> [ <file> | <whatever> ]    ##
##            .sh [ -h | --help ]                         ##
##                                                        ##
##    Parameters:                                         ##
##            -op1    Foo bar                             ##
##            -op2    Foo bar                             ##
##            -op3    Foo bar                             ##
##                                                        ##
############################################################


path=$(dirname $(readlink -f $0))    # Script path. Resolves symlinks.
me=$(basename $0)                    # script.sh
output=${me%.*}.out                  # script.out
input=${@: -1}                       # Gets last parameter as the input file
dir=/foo/bar




function showHelp
{
    echo -e "\n$me help:"
    sed '1,/\#\#\#\#/d;/\#\#\#\#/,$d;/ @/d;s/\#\#//g' $0
    exit 0
}




# DESCRIPTION
function op1
{
    # CODE HERE
}




# Check if given file exists
if [ ! -f "$input" ]
then
    echo -e "\n\t[ERROR] File $input not found\n"
    exit 1
fi


# Reset output file
> $output


# Check params
[ $# -eq 0 ] && showHelp
for param in "$@"
do
    case "$param" in
        "-h" | "--help" )
            showHelp
        ;;
        "-op1" )
            op1
        ;;
        * )
            if [ $param != "$input" ]
            then
                echo -e "\n\t[ERROR] Invalid $param parameter\n"
                showHelp
            fi
        ;;
    esac
done


echo -e "\nOutput file: $output"

exit 0