#!/bin/bash

# Demo case statement

# If else demo
#if [[ "${1}" = "start" ]]
#then
#  echo "Starting"
#elif [[ "${1}" = "stop" ]]
#then
#  echo "Stopping"
#elif [[ "${1}" = "status" ]]
#then
#  echo "Status"
#else
#  echo "Not a valid option"
#fi

# Case demo
# use | for multiple pattern match for a case statement
#case "${1}" in
#  start|st)
#    echo "Starting.."
#    ;;
#  stop|stp|--stp)
#    echo "Stopping."
#    ;;
#  status|state|--status|--state)
#    echo "Status:"
#    ;;
#  *)
#    echo "Not a valid option" >&2
#    ;;
#esac

case "${1}" in
  start|st) echo "Starting.." ;;
  stop|stp|--stp) echo "Stopping." ;;
  status|state|--status|--state) echo "Status:" ;;
  *) echo "Not a valid option" >&2 ;;
esac

