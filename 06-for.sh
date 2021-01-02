#!/bin/bash

# Gen passfor each user user

# Display what user typed in command line
# Parameters - Variable used inside the shell script
# Arguement - Passed to the script.
# Position parameters - $0, $1....

echo "You executed this command: ${0}"

# Display and file name of the script
echo "Dirname: $(dirname ${0})  and file name: $(basename ${0})"

# Tell how many args passed
# $# also can be used
# a "b c d" e => " " all chars considered one arg . we can use ' '
NUM_PARAMS="${#}"
echo "There are ${NUM_PARAMS} args"

# make sure one args atleast
if [[ "${NUM_PARAMS}" -lt 1 ]] # "${#}" -eq 0 is also fine
then
  echo "Usage: ${0} USERNAME [USERNAME].."
  exit 1
fi

# Generate and display a password for each parameter
# ${*} to get all the args as one full string
for USER_NAME in "${@}"
#for USER_NAME in "${*}"
do
  PASSWORD=$(date +%s%N | sha256sum | head -c 48)
  echo "${USER_NAME}: ${PASSWORD}"
done


