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
tmpdir=$0.tmpdir
dir=/foo/bar
file=${@: -1}     # Gets last parameter as the input file

# Parameter flags
op1=0
op2=0
op3=0




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
            op1=1
        ;;
        "-op2" )
            op2=1
        ;;
        "-op3" )
            op3=1
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


# Check if given file exists
if [ ! -f "$file" ]
then
    echo -e "\n\t[ERROR] $file file does not exist!\n"
    exit 1
fi


# Reset output file
echo -n "" > $output
if [ -d $tmpdir ]
then
    rm -rf $tmpdir
fi


if [ $op1 -eq 1 ]
then
    # CODE HERE
fi


rm -rf $tmpdir

echo -e "\nOutput file: $output"

exit 0