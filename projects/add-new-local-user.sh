#!/bin/bash

# Make sure the script is being executed with superuser privileges.
if [[ "${UID}" -ne 0 ]]
then
  echo "$(id -un) is not root user"
  exit 1
fi

# If the user doesn't supply at least one argument, then give them help.
if [[ "${#}" -lt 2 ]]
then
  echo "Usage: ${0} USER_NAME REAL_NAME/COMMENTS"
  exit 1
fi

# The first parameter is the user name.
USERNAME=${1}
shift

# The rest of the parameters are for the account comments.
REAL_NAME=${*} # Can use ${@} - check where is useful

echo "Username: ${USERNAME}, Realname: ${REAL_NAME}"


# Generate a password.
#PASSWORD=$(date +%s%N | fold -w1 | shuf | head -c48)
PASSWORD=$(date +%s%N | sha256sum | head -c32)

# Create the user with the password.
useradd -c "${REAL_NAME}" -m "${USERNAME}"

# Check to see if the useradd command succeeded.
if [[ "${?}" -ne 0 ]]
then
  echo "Error during account creation ${USERNAME}"
  exit 1
fi

# Set the password.
echo "${PASSWORD}" | passwd --stdin "${USERNAME}"

# Check to see if the passwd command succeeded.
if [[ "${?}" -ne 0 ]]
then
  echo "Error during password configuration"
  exit 1
fi

# Force password change on first login.
passwd -e "${USERNAME}"

# Display the username, password, and the host where the user was created.
echo
echo "Account Creation details:"
echo
echo "Username: ${USERNAME}"
echo "Password: ${PASSWORD}"
echo "Hostname: ${HOSTNAME}"
echo
