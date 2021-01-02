#!/bin/bash

Usage() {
  echo "Usage: ${0} [-dra] USER"
  echo "   -d Delete account"
  echo "   -r remove home directory as well"
  echo "   -a create archive of home directory under /archives"
  exit 1
}

# Only root can delete an user
if [[ "${UID}" -ne 0 ]]
then
  echo "No root permission, run with sudo" >&2
  exit 1
fi

if [[ "${#}" -eq 0 ]]
then
  Usage
fi

# Process all options
while getopts dra OPTION
do
  case ${OPTION} in
    d)
      DELETE_ACCOUNT="true"
      ;;
    r)
      REMOVE_DIR="true"
      REMOVE_OPT="-r"
      ;;
    a)
      DO_ARCHIVE="true"
      ;;
    ?)
      Usage
      ;;
  esac
done

if [[ "${REMOVE_DIR}" = "true" && "${DELETE_ACCOUNT}" != "true" ]]
then
  echo "Disable account and remove home directory is not right option" >&2
  exit 1 
fi

shift "$(( OPTIND - 1 ))"

for USERNAME in "${@}"
do
    USERID=$(id -u ${USERNAME})
    if [[ "${?}" -ne 0 ]]
    then
      echo "Could not get user ID for ${USERNAME}" >&2
      exit 1
    fi
    if [[ "${USERID}" -lt 1000 ]]
    then
      echo "User id of the account to delete is less than 1000: UID: ${USERID}" >&2
      exit 1
    fi

    # Archive the home directory if requested
    if [[ "${DO_ARCHIVE}" = "true" ]]
    then 
      mkdir -p /archives
      if [[ "${?}" -ne 0 ]]
      then
        echo "Archive directory creation failure" >&2
        exit 1
      fi

      ARCHIVE_FILE="/archives/${USERNAME}-$(date +%F-%N).tar.gz"
      tar -zcvf "${ARCHIVE_FILE}" "/home/${USERNAME}/"	    
      if [[ "${?}" -ne 0 ]]
      then
        echo "Archive directory creation failure" >&2
        exit 1
      fi
      echo "Archive of home directory done: archive name: ${ARCHIVE_FILE}"
    fi

    # Delete the user based on the arg
    if [[ "${DELETE_ACCOUNT}" = "true" ]]
    then
      userdel ${REMOVE_OPT} ${USERNAME}
      if [[ "${?}" -ne 0 ]]
      then
        echo "Account ${USERNAME} delete failed" >&2
        exit 1
      fi
      echo "Deleting account ${USERNAME} success"
    else
      chage -E 0 "${USERNAME}"
      if [[ "${?}" -ne 0 ]]
      then
        echo "Account ${USERNAME} disable failed" >&2
        exit 1
      fi
      echo "Disabling account ${USERNAME} success"
    fi
done
exit 0


