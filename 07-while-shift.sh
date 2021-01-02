#!/bin/bash

# Demo the use of shift and while loops

# Display the first three parameters
echo "Parameter 1: ${1}"
echo "Parameter 2: ${2}"
echo "Parameter 3: ${3}"
echo

# help while => while COMMANDS; do COMMANDS; done
# help true
# man sleep

while [[ "${#}"  -gt 0 ]]
do
  echo "Number of params: ${#}"
  echo "Parameter 1: ${1}"
  echo "Parameter 2: ${2}"
  echo "Parameter 3: ${3}"
  echo
  shift
done

