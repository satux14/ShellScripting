#/bin/bash

# Demo I/O redirection
# 3 types: stdio/stdin/stderr
# COMMAND &> FILE
# COMMAND |& COMMAND

# Redirect STDOUT to a file
FILE="/tmp/data"
head -n1 /etc/passwd > ${FILE}

# Redirect STDIN to a program
read LINE < ${FILE}
echo "Line contains: ${LINE}"

# Redirect STDOUT to file - overwrite
head -n3 /etc/passwd > ${FILE}
echo
echo "Contents of the ${FILE}"
cat ${FILE}

# Redirect STDOUT to file and append
echo "${RANDOM}${RANDOM}" >> ${FILE}
echo "${RANDOM}${RANDOM}" >> ${FILE}
echo
echo "Contents of the ${FILE}"
cat ${FILE}

# Redirect STDIN to a program using FD 0
read LINE 0< ${FILE}
echo
echo "Line contains: ${LINE}"

# Redirect STDOUT to a file using FD 1
head -n3 /etc/passwd 1> ${FILE}
echo
echo "Contents of the ${FILE}"
cat ${FILE}

# Redirect STDERR to a file using FD 2
ERR_FILE="/tmp/data.err"
head -n3 /etc/passwd /etc/host /etc/hosts 2> ${ERR_FILE}

# Redirect STDOUT and STDERR to a file
head -n3 /etc/passwd /etc/host /etc/hosts &> ${ERR_FILE}
echo
echo "Contents of the ${ERR_FILE}"
cat ${ERR_FILE}

# Send output to STDERR
# script 2> err will send the below err to a file: err
echo "This is standard error " >&2

# Discard stdout
echo 
echo "Discarding STDOUT"
head -n3 /etc/passwd /etc/host > /dev/null

# Discard stderr
echo
echo "Discarding STDERR"
head -n3 /etc/passwd /etc/host 2> /dev/null

# Discard stdout and stderr
echo
echo "Discarding both STDOUT and STDERR"
head -n3 /etc/passwd /etc/host &> /dev/null

# Clean up files
echo
echo "Cleaning up files"
rm ${FILE} ${ERR_FILE} &> /dev/null




