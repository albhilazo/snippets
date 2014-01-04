# From: http://www.linuxnix.com/2012/07/23-awesome-less-known-linuxunix-command-chaining-examples.html

# & operator
# Run one command in background
ping ­-c1 www.google.com &
# Run multiple commands in background simultaneously
apt-get update & apt-get upgrade &


# ; operator
# Run multiple commands sequentially
apt-get update ; apt-get upgrade ; mkdir test


# && operator (AND)
# Execute second command only if the first is successful
ping -c1 www.google.com && links www.google.com    # if(ping){ links }

    # Assign a value to a variable if it's not set
    [ -z $VAR1 ] && VAR1=10

    # Create a folder if it does not exist
    [ ! -d /var/temp ] && mkdir /var/temp


# || operator (OR)
# Execute second command only if the first fails
ping -c1 www.google.es || ping -c1 www.google.com    # if(ping.es){} else{ ping.com }

    # Create a folder if it does not exist
    [ -d /var/temp ] || mkdir /var/temp


    # if-else example
    # if(ping){ verified } else{ host down }
    ping -c1 www.google.com && echo "Verified" || echo "Host down"


# ! operator (NOT)
# Execute all except the condition
rm !(*.html)


# {} operator
# Combine two or more commands
[ -f /opt/abc.txt ] || { echo “The file does not exist”; touch /opt/abc.txt; }
# Space between braces and ; after last command is mandatory


# () operator
# Execute commands in precedence order
( caommand1 && command2 ) || ( command3 && command4 )