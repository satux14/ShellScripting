#!/bin/bash

# Display UID and user name
# Display if the user is vagrant user or not

# Display UID
echo "Your UID is ${UID}"

# Only disply if the UID does not 1000
UID_TO_TEST='1000'

if [[ "${UID}" -ne "${UID_TO_TEST}" ]]
then
  echo "Your UID does not match ${UID_TO_TEST}"
  # Non zero exit status for error. We can use any non-zero value
  # In success case, exit status is 0
  exit 1
fi

# Display user name
USER_NAME=$(id -un)

# Test if the command succeeded
if [[ "${?}" -ne 0 ]]
then
  echo "The id command did not complete successfully"
  exit 1
fi

echo "Your user name is ${USER_NAME}"

# String test conditional
USER_NAME_TO_TEST='vagrant'

# You can use == or = sign for condition check inside the [[ ]]
if [[ "${USER_NAME}" = "${USER_NAME_TO_TEST}" ]]
then
  echo "Your name matches with ${USER_NAME_TO_TEST}."
fi

# Test for != for string
# user "${VAR}"
if [[ "${USER_NAME}" != "${USER_NAME_TO_TEST}" ]]
then
  echo "Your username does not match with ${USER_NAME_TO_TEST}."
fi
exit 0

