#!/bin/bash

# Check for root privilege
# Prompt for user/real_user/password
# Get hostname
# Create new user
# Expire password

# Get user name
USER_NAME=$(id -un)

# Check for root privilege
if [[ "${UID}" -ne 0 ]]
then
  echo "Hi ${USER_NAME}, No root privilege. execute with sudo"
  exit 1
fi

# Prompt for user/real_user/password
read -p "Enter user name: " USER_NAME
read -p "Enter real user name: " REAL_NAME
read -p "Enter password: " PASSWORD

# Crate user
useradd -c "${REAL_NAME}" -m "${USER_NAME}"
if [[ "${?}" -ne 0 ]]
then
  echo "The account could not be created"
  exit 1
fi

# Password for the user
echo "${PASSWORD}" | passwd --stdin "${USER_NAME}"
if [[ "${?}" -ne 0 ]]
then
  echo "The password for the account could not be set"
  exit 1
fi

# Expire the password for the user
passwd -e ${USER_NAME}

# get hostname
HOST_NAME=$(hostname)

# Display all the details to the help desk
echo 
echo "Following user is created successfully"
echo "User Name: ${USER_NAME}"
echo "Real Name: ${REAL_NAME}"
echo "Password: ${PASSWORD}"
echo "Created in the hostname: ${HOSTNAME}"

