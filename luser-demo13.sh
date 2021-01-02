#!/bin/bash

# Display all open TCP ports
# -4 for IPv4 TCP ports
if [[ "${1}" = "-4" ]]
then
  netstat -nutl ${1} | grep ':' | awk '{print $4}' | awk -F ':' '{print $NF}'
else
  echo "Uknonwn option" >&2
fi


