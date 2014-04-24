#!/bin/bash

for i in $(ls -1 /var/log/foo/bar.log.*|grep -v gz)
do
    DATE=$(stat -c "%y" $i | awk '{print $1"."$2}'| cut -f1,2 -d.)
    FILE="/var/log/foo/bar.log.${DATE}"
    if [ ! -e "${FILE}" ]
    then
        mv $i "${FILE}"
        gzip "${FILE}"
    fi
done

# Save last 90 days
find /var/log/foo/bar.log.* -mtime +90 -exec rm {} \;