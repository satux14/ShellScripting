#!/bin/bash

# Script generates list of random passwords
PASSWORD=${RANDOM}

echo "${PASSWORD}"

# Three random vars
MPASSWORD=${RANDOM}${RANDOM}${RANDOM}

echo "${MPASSWORD}"

# Use date/time for password generator
PASSWORD=$(date +%s)

echo "${PASSWORD}"

# User nanoseconds for password
PASSWORD=$(date +%s%N)

echo "${PASSWORD}"

# use SHA for password
PASSWORD=$(date +%s%N | sha256sum | head -c32)

echo "${PASSWORD}"

# use random + SHA
PASSWORD=$(date +%s%N${RANDOM}${RANDOM} | sha256sum | head -c48)
echo "${PASSWORD}"

# Add special chars
SPECIAL_CHAR=$( echo '!@#$%^&*()_=+-' | fold -w1 | shuf | head -c1)
echo "${PASSWORD}${SPECIAL_CHAR}"

