#!/bin/bash

# creates an account on the local system
# You will be prompted for accound and password

# Ask for user name
read -p 'Enter the user name to create: ' USER_NAME

# Ask for real name
read -p 'Enter the name of the person: ' REAL_NAME

# Ask for password
read -p "Enter the password for user(${USER_NAME}): " PASSWORD

# Create user
useradd -c "${REAL_NAME}" -m "${USER_NAME}"

# Set the password
echo ${PASSWORD} | passwd --stdin ${USER_NAME}

# Force the user to change the pass or first time
passwd -e ${USER_NAME}

