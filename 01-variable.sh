#!/bin/bash

# comment: SheBang: #-Sharp + !-Bang
 
# Display 'Hello'
echo 'Hello'

# Assign a value to a variable
# No type required just assign the value
# No space before and after the '='
# we can use single or double quotation mark
#
# WORD, WORD1, _WORD - Valid
# 3WORD, A-WORD, E@MAIL - Not Valid
#
WORD='script'

# Display the value of the variable
# Precede $. Here " to expand the variable. If use ' no expansion - raw
echo "$WORD"

echo '$WORD'

# combine the variable with text
echo "This is a shell $WORD"

# Display the contents of the variable using {}
echo "This is a shell ${WORD}"

# Append text to the variable
# $WORDing will not work so use {}
echo "${WORD}ing is fun!!"

# how not to append text
# no variable with name WORDing in this script
echo "$WORDing is fun!"

# Create a new variable
ENDING='ed'

# combine 2 variables
echo "This is ${WORD}${ENDING}"

# Reassignment
ENDING='ing'
echo "This is ${WORD}${ENDING} is fun"

# Reassignment 
ENDING='s'
echo "We are going to write ${WORD}${ENDING}"
