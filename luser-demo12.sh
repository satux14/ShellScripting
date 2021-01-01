#!/bin/bash

# Delete a user

if [[ "${UID}" -ne 0 ]]
then
  echo "No root permission" >&2
  exit 1
fi

USER="${1}"

# delete user
userdel ${USER}

if [[ "${?}" -ne 0 ]]
then
  echo "The account ${USER} not deleted" >&2
  exit 1
fi

echo "The accound ${USER} is deleted"

