#!/bin/bash

############################################################################
##    @author     Albert Hilazo                                           ##
##    @version    1.0.0                                                   ##
##                                                                        ##
##    Load snippets for specific programming languages                    ##
##                                                                        ##
##    Syntax: snippets.sh <language> <snippet>                            ##
##            snippets.sh [ -se | --seteditor ] [ default | <editor> ]    ##
##            snippets.sh [ -h | --help ] [ <language> ]                  ##
##                                                                        ##
##    Languages:                                                          ##
##            android                                                     ##
##            ios                                                         ##
##            bash                                                        ##
##            css                                                         ##
##            js                                                          ##
##            php                                                         ##
##                                                                        ##
############################################################################


path=$(dirname $(readlink -f $0))    # Script path. Resolves symlinks.
me=$(basename $0)                    # script.sh
editor=xdg-open




# Prints script help. If a language is specified, lists its snippets
# @param $1    Language name/directory
function showHelp
{
    lang=$1
    if [[ -z $lang || ! -d $path/$lang ]]
    then
        echo -e "\n$me help:"
        sed '1,/\#\#\#\#/d;/\#\#\#\#/,$d;/ @/d;s/\#\#//g' $0
    else
        listSnippets $lang
    fi
    
    exit 0
}




# Lists the available snippets for the given language
# @param $1    Language name/directory
function listSnippets
{
    lang=$1
    echo -e "\n$(tr '[:lower:]' '[:upper:]' <<< "$lang") snippets:\n"
    while read row
    do
        echo -e "    ${row%.*}"
    done < <(ls $path/$lang)
    echo ""

    exit 0
}




# Edits this same script to set a new editor command
# @param $1    Editor command
function setEditor
{
    cmd=$1
    [ -z $cmd ] && echo -e "\nThe current selected editor is $editor" && showHelp
    [ $cmd == "default" ] && cmd='xdg-open'

    if ! type $cmd &> /dev/null
    then
        echo -e "\n[ERROR] The given text editor command does not exist\n"
        exit 1
    else
        originalfile=$(readlink -f $0)
        tmpfile=/tmp/$me.tmp
        cat $0 | sed "s/^editor=[a-zA-Z0-9._-]*/editor=$cmd/g" > $tmpfile
        mv $tmpfile $originalfile
        echo -e "\nFollowing snippets will open using $1 editor\n"
        exit 0
    fi
}




function getSnippet
{
    lang=$1
    snippet=$2
    [ -z $snippet ] && listSnippets $lang

    countls=$(ls $path/$lang/$snippet.* 2>/dev/null | wc -l)
    if [ $countls -eq 1 ]
    then
        snippetfile=$(ls $path/$lang/$snippet.* 2>/dev/null)
        tmpfile=/tmp/$(basename $snippetfile)
        cat $snippetfile > $tmpfile
        $editor $tmpfile &
        exit 0
    else
        echo -e "\n[ERROR] Could not relate the snippet to an existing file\n"
        exit 1
    fi
}




# Check params
[[ $# -eq 0 || $# -gt 2 ]] && showHelp

case $1 in
    "-se" | "--seteditor" )
        setEditor $2
    ;;
    "-h" | "--help" )
        showHelp $2
    ;;
    * )
        if [ -d $path/$1 ]
        then
            getSnippet $1 $2
        else
            echo -e "\n[ERROR] Invalid option: $1"
            showHelp
        fi
    ;;
esac


exit 0