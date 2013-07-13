#!/bin/bash

####################################################################################################
##                                                                                                ##
##    Syntax: snippets.sh bash [ new [<filename>] ]                                               ##
##            snippets.sh php                                                                     ##
##            snippets.sh [ -h | --help ]                                                         ##
##                                                                                                ##
####################################################################################################


path=`dirname $(readlink -f $0)`
me=`basename $0`




function showHelp
{
    echo -e "\nSnippets help:"
    echo -e "\tSyntax: $me bash [ new [<filename>] ]"
    echo -e "\t        $me php"
    echo -e "\t        $me [ -h | --help ]\n"
    exit 0
}




# Check params
if [ $# -eq 0 ]
then
    showHelp
fi
case "$1" in
    "-h" | "--help" )
        showHelp
    ;;
    "bash" )
        $path/bash/index-bash.sh $2 $3
    ;;
    "php" )
        $path/php/index-php.sh $2
    ;;
    * )
        echo -e "\nInvalid $param parameter!"
        showHelp
    ;;
esac

exit 0