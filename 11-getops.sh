#!/bin/bash

# Colon for mandatory, optstring, do it in while loop

# Generates random password
# user can set password length with -l and special chars with -s option
# Verbose mode can be enabled with -v

# Set a default pass length
LENGTH=48

Usage() {
  echo "Usage: ${0} [-vs] [-l LENGTH]" >&2
  echo "Generate random password"
  echo "    -l LENGTH Specify the password length"
  echo "    -s Append a special char to the password"
  echo "    -v Increase verbosity"
  exit 1
}

log() {
  local MESSAGE="${@}"
  if [[ "${VERBOSE}" = "true" ]]
  then
    echo "${MESSAGE}"
  fi
}

# vls options, l needs argument so l:
while getopts vl:s OPTION
do
  case ${OPTION} in
    v)
      VERBOSE="true"
      log "Verbose on"
      ;;
    l)
      LENGTH="${OPTARG}"
      ;;
    s)
      SPL_CHAR="true"
      ;;
    ?) # getops gives single chars so ? is used instead of *
      Usage
      ;;
  esac
done

# Inspect OPTIND
#echo "OPTIND: ${OPTIND}"
# Remove the options which are seen by getops
# OPTIND will hold at which place the getopts finished processing
shift "$(( OPTIND - 1 ))"

if [[ "${#}" -gt 0 ]]
then
  Usage
fi

log "Generating a password"

PASSWORD=$(date +%s%N${RANDOM}${RANDOM} | sha256sum | head -c${LENGTH})

# Append a special char if asked by user
if [[ "${SPL_CHAR}" = "true" ]]
then
  log "Adding special char to generated password"
  SPL_CHAR_GET=$(echo "!@#$%^&*()_+-=" | fold -w1 | shuf | head -c1) 
  PASSWORD="${PASSWORD}${SPL_CHAR_GET}"
fi


log "Done"
log "Here is the password:"

# Display the password
echo "${PASSWORD}"
exit 0


