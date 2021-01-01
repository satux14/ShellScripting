#!/bin/bash

# Display UID and username of the user executing the script
# Display if the user is root or not

# Display the UID (man bash)
echo "Your uid is ${UID}"


# Display the username
# $() to execute the command
USER_NAME=$(id -un)

# back tick to execute the command - old method
#USER_NAME=`id -un`

echo "Your user name is ${USER_NAME}"

# Display if the user is root or not
# if space double opening bracket space then close double opening bracket
# Run it with sudo - super user do and see the UID/USER_NAME
# You can use single bracket but it is older method
if [[ "${UID}" -eq 0 ]]
then
  echo "You are root"
else
  echo "You are not root"
fi
# Do this UID to 0 for sanity or idiot checking where needed
