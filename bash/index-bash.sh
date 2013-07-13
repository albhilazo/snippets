#!/bin/bash

####################################################################################################
##                                                                                                ##
##    Options:  index-bash.sh new [ <filename> ]                                                  ##
##              index-bash.sh [ -h | --help ]                                                     ##
##                                                                                                ##
##    Snippets: template                                                                          ##
##              sort                                                                              ##
##                                                                                                ##
####################################################################################################


path=`dirname $(readlink -f $0)`
file=$2




function showHelp
{
    echo -e "\nBash index:"
    echo -e "\tOptions:  new [ <filename> ]"
    echo -e "\t          [ -h | --help ]\n"
    echo -e "\tSnippets: template"
    echo -e "\t          sort\n"
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
    "new" )
        if [ $file ]
        then
            mkdir -p $(dirname $file)
            cat $path/template.sh >> $file
        else
            openSnippet $path/template.sh
        fi
    ;;
    "template" )
        openSnippet $path/template.sh
    ;;
    "sort" )
        openSnippet $path/sort.sh
    ;;
    * )
        echo -e "\nInvalid $param parameter!"
        showHelp
    ;;
esac

exit 0