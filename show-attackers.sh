#!/bin/bash

# Just pasting the while loop with the output of the command

grep Failed syslog | awk '{print $(NF - 3)}' | sort | uniq -c | sort -nr | while read COUNT IP
do
  if [[ "${COUNT}" -gt 10 ]]
  then
     LOCATION=$(geoiplookup ${IP} | awk -F ', ' '{print $2}')
     echo "${COUNT},${IP},${LOCATION}"
  fi
done
exit 0
