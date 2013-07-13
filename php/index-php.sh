#!/bin/bash

####################################################################################################
##                                                                                                ##
##    Options:  index-php.sh [ -h | --help ]                                                      ##
##                                                                                                ##
##    Snippets: date                                                                              ##
##                                                                                                ##
####################################################################################################


path=`dirname $(readlink -f $0)`




function showHelp
{
    echo -e "\nBash index:"
    echo -e "\tOptions:  [ -h | --help ]\n"
    echo -e "\tSnippets: date\n"
    exit 0
}




# $1 = Snippet file to open
function openSnippet
{
    if [ -f /usr/bin/sublime-text ]
    then
        sublime-text $1
    else
        xdg-open $1     # default app
    fi
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
    "date" )
        openSnippet $path/date.php
    ;;
    * )
        echo -e "\nInvalid $param parameter!"
        showHelp
    ;;
esac

exit 0