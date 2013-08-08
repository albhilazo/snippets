#!/bin/bash

####################################################################################################
##                                                                                                ##
##    Syntax: .sh [ -op1 | -op2 | -op3 ] [ <file> | <whatever> ]                                  ##
##            .sh [ -h | --help ]                                                                 ##
##                                                                                                ##
##    Parameters:                                                                                 ##
##            -op1:       Foo bar.                                                                ##
##            -op2:       Foo bar.                                                                ##
##            -op3:       Foo bar.                                                                ##
##                                                                                                ##
####################################################################################################


path=`dirname $(readlink -f $0)`    # Script path. Resolves symlinks.
me=`basename $0`
output=$0.output
dir=/foo/bar
file=${@: -1}     # Gets last parameter as the input file




function showHelp
{
    echo -e "\n$me help:"
    echo -e "\tSyntax: $me [ -op1 | -op2 | -op3 ] [ <file> | <whatever> ]"
    echo -e "\t        $me [ -h | --help ]\n"
    echo -e "\tParameters:"
    echo -e "\t\t-op1:  Foo bar."
    echo -e "\t\t-op2:  Foo bar."
    echo -e "\t\t-op3:  Foo bar.\n"
    exit 0
}




# DESCRIPTION
function op1
{
    # CODE HERE
}




# Check if given file exists
if [ ! -f "$file" ]
then
    echo -e "\n\t[ERROR] $file file does not exist!\n"
    exit 1
fi


# Reset output file
echo -n "" > $output

# Check params
if [ $# -eq 0 ]
then
    showHelp
fi
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
            if [ $param != "$file" ]
            then
                echo -e "\nInvalid $param parameter!"
                showHelp
            fi
        ;;
    esac
done


echo -e "\nOutput file: $output"

exit 0