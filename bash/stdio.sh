# STDOUT and STDERR to log file
#   -a appends log, without it overwrites old log
exec >  >(tee -a foo.log)
exec 2>&1

    # The following is valid too, but two 'tee' processes may
    #   end overlapping in the same line of the log file
    exec >  >(tee -a foo.log)
    exec 2> >(tee -a foo.log >&2)


# Command to file descriptor
grep "foo" < <(ls -l)

    # Reading STDIN from a pipe always opens a subshell with its own variable scope
    # Loop example. If done with pipes, all changes to variables will be lost
    while read row
    do
        # something
    done < <(ls -l)


# Variable or string as file
# No more $(echo "foo bar" | grep "bar")
aux=$(ls -l)
grep "bar" <<< "$aux"
grep "bar" <<< "foo bar"

    # Loop example
    aux=$(ls -l)
    while read row
    do
        # something
    done <<< "$aux"




# ************************************************************************************************ #
# Confirm
#

echo -ne "Continue? [Y/n]? "
read -s -n 1 confirm

# [Y/n]
[ -n $confirm ] && [ $confirm != 'Y' ] && [ $confirm != 'y' ] && echo "" && return

# [y/N]
[ -z $confirm ] && return || [ $confirm != 'Y' ] && [ $confirm != 'y' ] && echo "" && return