```
Review:
Shebang: #!/bin/bash
Comments #
Variables: VAR="value"
echo
"${VAR} get expanded"
'${VAR} does not get expanded'
type -a name
help <shell built in>
man linux_cmd
HOSTNAME, RANDOM, UID - Bash builtin variables
VAR=$(command)
VAR=`command`
echo "ou: $(command)"
if [[ COMMANDS ]]
then
   COMMANDS
else
  COMMANDS
fi
Exit Status:
0=true, 1=false
echo ${?} => Get exit status

Sanity Check:
if [[ "${UID}" -ne 0 ]]
then 
  echo "Please run as root"
fi

Command line Conventions:
id -un/id -u -n/id -nu/id --user --name

Obtain Stdin
read -p "A prompt:" VARIABLE

Random Data
echo ${RANDOM} -> Shell variable
date +%s%N | sha256sum | head -c8

Positional Parameters:
$0, $1,
$* = when used in quotes: "$1 $2.."
$@ = when used in quotes: "$1" "$2" …
$# = Number  of positional parameters

For loop
for VARIABLE in LIST
do
  COMMANDS
done

while [[  COMMANDS ]]
do
  COMMANDS
done

IO Redirction:
echo ${PWORD} | passwd --stdin ${NAME}
string manipulation/data munging
echo "!@#$%^&*()_+=-" | fold -w1 | shuf | head -c1

File IO Redirection:
COMMAND > /path/to/file
COMMAND >> /path/to/file
COMMAND < /path/to/file
COMMAND 2> /path/to/file => stderr
COMMAND &> /path/to/file => both stdout and stderr to file
COMMAND |& COMMAND => Send both via pipe
COMMAND >&2 => Redirect message stderr
COMMAND > /dev/null
```
