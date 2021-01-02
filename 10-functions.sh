#!/bin/bash

# Demo for functions

#function log {
#  echo "log function enters"
#}

log() {
  # This function sends message to syslog and print message if verbose enabled

  #TEST_GLOBAL="Global value seen after this function call"
  # Use local always so it is local and no overwriting global variables
  local VERBOSE="${1}"
  shift
  local MESSAGE="${@}"
  if [[ "${VERBOSE}" = "true" ]]
  then
    echo "${MESSAGE}"
  fi
  logger -t "${0}" "${MESSAGE}"
}

backup_file() {
  # creates backup of a file. Return non-zero if error
  local FILE="${1}"

  if [[ -f "${FILE}" ]]
  then
    local BACKUP_FILE="/var/tmp/$(basename ${FILE}).$(date +%F-%N)"
    log "${VERBOSITY}" "Backing up ${FILE} to ${BACKUP_FILE}"

    # Preserve mode/permission/ownership and timestamp 
    cp -p ${FILE} ${BACKUP_FILE}
    return 0
  else
    # the file does not exists
    log "${VERBOSITY}" "File ${FILE} does not exist"
    return 1
  fi
}

readonly VERBOSITY="true"
log "${VERBOSITY}" "Hello"
#VERBOSE="true"
#VERBOSITY="false" # VERBOSITY: readonly variable
log "${VERBOSITY}" "This is fun!!"

backup_file "/etc/passwd"

# Use return value of the function
if [[ "${?}" -eq 0 ]]
then
  log "${VERBOSITY}" "File backup succeeded!"
  exit 0
else
  log "${VERBOSITY}" "File backup failed"
  exit 1
fi


