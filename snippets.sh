#!/bin/bash

############################################################
##                                                        ##
##    Load snippets for specific programming languages    ##
##                                                        ##
##    Syntax: snippets.sh <parameter> [ <snippet> ]       ##
##            snippets.sh <parameter> [ -h | --help ]     ##
##            snippets.sh [ -h | --help ]                 ##
##                                                        ##
##    Parameters:                                         ##
##            bash                                        ##
##            css                                         ##
##            js                                          ##
##            php                                         ##
##                                                        ##
############################################################
 

path=$(dirname $(readlink -f $0))    # Script path. Resolves symlinks.
me=$(basename $0)                    # script.sh
input=${@: -1}                       # Gets last parameter as the input file




function showHelp
{
    echo -e "\n$me help:"
    echo -e "\tSyntax: $me <parameters> [ <file> | <whatever> ]"
    echo -e "\t        $me [ -h | --help ]\n"
    echo -e "\tParameters:"
    echo -e "\t\t-op1    Foo bar."
    echo -e "\t\t-op2    Foo bar."
    echo -e "\t\t-op3    Foo bar.\n"
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
    echo -e "\n\t[ERROR] $input file does not exist!\n"
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
            if [ $param != "$input" ]
            then
                echo -e "\nInvalid $param parameter!"
                showHelp
            fi
        ;;
    esac
done


echo -e "\nOutput file: $output"

exit 0