# From: http://www.tldp.org/LDP/abs/html/internalvariables.html

# ************************************************************************************************ #
# Script or function parameters
#

./script.sh foo bar baz

# $0, $1, $2 ...
# Parameters passed
    echo $0	   # ./script.sh
    echo $1    # foo
    echo $2	   # bar


# $#
# Number of parameters
    echo $#    # 3


# $*
# All the parameters as a single word
    echo "$*"  # foo bar baz

    # Loop through parameters
    # If quoted ("$*") it will all output in a single iteration
    for param in $*
    do
        echo $param
    done


# $@
# All the parameters as separated words
    echo "$@"  # foo bar baz

    # Loop through parameters
    # Works quoted
    for param in "$@"
    do
        echo $param
    done


# shift N
# Parameters are shifted to the left N positions (default 1)
    shift ; echo "$*"    # bar baz
    shift 2 ; echo "$*"  # baz




# ************************************************************************************************ #
# Previous command parameters
#

# $_
# Last parameter passed to last command executed
    ls -l ; echo $_       # -l
    ls -l *.sh ; echo $_  # script.sh
    # In the previous example, if *.sh matches more than one file it will output the last one


# $?
# Exit status of last command, function or script executed
    mkdir tmp ; echo $?   # 0
    mkdir tmp ; echo $?   # 1 (already exists)


# $!
# PID of last command run in background
    sleep 100 &
    echo "PID: $!"    # PID: 12345


# $$
# PID of the script itself
    echo "PID: $$"    # PID: 12345