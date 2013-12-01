#!/bin/bash

############################################################
##                                                        ##
##    Load snippets for specific programming languages    ##
##                                                        ##
##    Syntax: snippets.sh <language> [ <snippet> ]        ##
##            snippets.sh <language> [ -h | --help ]      ##
##            snippets.sh [ -h | --help ]                 ##
##                                                        ##
##    Languages:                                          ##
##            android                                     ##
##            bash                                        ##
##            css                                         ##
##            js                                          ##
##            php                                         ##
##                                                        ##
############################################################
 

path=$(dirname $(readlink -f $0))    # Script path. Resolves symlinks.
me=$(basename $0)                    # script.sh




function showHelp
{
    echo -e "\n$me help:"
    echo -e "\tLoad snippets for specific programming languages\n"
    echo -e "\tSyntax: $me <language> [ <snippet> ]"
    echo -e "\t        $me <language> [ -h | --help ]"
    echo -e "\t        $me [ -h | --help ]\n"
    echo -e "\tLanguages:"
    echo -e "\t\tandroid"
    echo -e "\t\tbash"
    echo -e "\t\tcss"
    echo -e "\t\tjs"
    echo -e "\t\tphp\n"
    exit 0
}




# Prints a list of the sections available for the given language
# @param $1    Language name/directory
function showSections
{
    echo -e "\nSections available for $(tr '[:lower:]' '[:upper:]' <<< "$1"):"
    while read row
    do
        echo -e "\t${row%.*}"
    done < <(ls -d $path/$1/*/)
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
    "android" )
        showSections $1 # TODO: comprobar $2 antes y usar esta llamada genérica????
    ;;
    "bash" )
        showSections $1
    ;;
    "css" )
        showSections $1
    ;;
    "js" )
        showSections $1
    ;;
    "php" )
        showSections $1
    ;;
    * )
        echo -e "\n\t[ERROR] Invalid $param parameter\n"
        showHelp
    ;;
esac


exit 0