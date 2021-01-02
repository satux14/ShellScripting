# ShellScripting
```
Shell Script Basics/Introduction:
# Sharp, ! Bang - SheBang
Use shell builtin
type echo
help echo for shell builtins
check for uptime

$() execute any commands
`` execute any commands old method

man bash -> UID
() -> Execute command
if [[ COND ]] for if statement and condition
then
else
fi
COND => "${VAR}" cond "$VAR}"

Input Processing:
read built in command
Args reading
read -p for prompt
[vagrant@localhost vagrant]$ read -p 'Type Somthing: ' INPUT
Type Somthing: Test_input
[vagrant@localhost vagrant]$ echo $INPUT
Test_input
[vagrant@localhost vagrant]$

useradd for adding user

RANDOM => random number generator
!v -> run the last command start with v
!m -> run the last command start with m

date -> option %s, since 1970 - epoch time
date +%s

sha256sum
date %s | sha256sum

head -1
head -n 1
head -n1
head -c2 => character

shuf -> Random permutation
fold - wrap input line to fit in specified width
[vagrant@localhost ShellScripting]$ echo "${S}"
!@#$%^&*()_+-=
$ echo "${S}" | fold -w1 | shuf | head -c1 => Random special character

Data munging/string manipulation -> Use series of commands to obtain end result

Positional parameters : $0, $1…

PATH: If executing 

hash -r => Forgot all remember location

[vagrant@localhost ShellScripting]$ basename /vagrant/ShellScripting/luser-demo06.sh
luser-demo06.sh
[vagrant@localhost ShellScripting]$ basename /this/is/test
test
[vagrant@localhost ShellScripting]$

basename
dirname
[vagrant@localhost ShellScripting]$ dirname /vagrant/ShellScripting/luser-demo06.sh
/vagrant/ShellScripting
[vagrant@localhost ShellScripting]$ dirname /this/is/test
/this/is
[vagrant@localhost ShellScripting]$

${#} => Number of args

For Loop:
[vagrant@localhost ShellScripting]$ for X in Sathish Kumar Raju
> do
>   echo "Hi ${X}."
> done
Hi Sathish.
Hi Kumar.
Hi Raju.

man bash -> Special Parameters

# help while => while COMMANDS; do COMMANDS; done                                      
# help true                                                                            
# man sleep 
help shift => Shift position parameter
${#} reduce by shift n times when shift is used

STDOUT >, STDIN <, APPEND >>

File Descriptors: 0, 1, 2 (STDIN, STDOUT, STDERR)

head -n1 /etc/passwd /etc/host 2> head.err
> => Implicits the STDOUT 1> ===> > is equal to 1>
For stderr, explicitly mention the 2> for redirection

[vagrant@localhost ShellScripting]$ head -n1 /etc/passwd /etc/host 2>> head.err > head.out
[vagrant@localhost ShellScripting]$ cat head.*
head: cannot open ‘/etc/host’ for reading: No such file or directory
head: cannot open ‘/etc/host’ for reading: No such file or directory
head: cannot open ‘/etc/host’ for reading: No such file or directory
==> /etc/passwd <==
root:x:0:0:root:/root:/bin/bash
[vagrant@localhost ShellScripting]$

Both STDOUT and STDERR
[vagrant@localhost ShellScripting]$ head -n1 /etc/passwd /etc/host > head.both 2>&1
[vagrant@localhost ShellScripting]$ cat head.both
==> /etc/passwd <==
root:x:0:0:root:/root:/bin/bash
head: cannot open ‘/etc/host’ for reading: No such file or directory
[vagrant@localhost ShellScripting]$

2>&1 => Redirect stderr, & for file descriptor
New syntax: &>
[vagrant@localhost ShellScripting]$ head -n1 /etc/passwd /etc/host &> head.both
[vagrant@localhost ShellScripting]$ cat head.both
==> /etc/passwd <==
root:x:0:0:root:/root:/bin/bash
head: cannot open ‘/etc/host’ for reading: No such file or directory
[vagrant@localhost ShellScripting]$

Stderr to stdout during pipe
[vagrant@localhost ShellScripting]$ head -n1 /etc/passwd /etc/hosts /etc/host 2>&1 | cat -n
     1  ==> /etc/passwd <==
     2  root:x:0:0:root:/root:/bin/bash
     3
     4  ==> /etc/hosts <==
     5  127.0.0.1   localhost localhost.localdomain localhost4 localhost4.localdomain4
     6  head: cannot open ‘/etc/host’ for reading: No such file or directory
[vagrant@localhost ShellScripting]$

Stderr to stdout during pipe: New Syntax: |&
[vagrant@localhost ShellScripting]$ head -n1 /etc/passwd /etc/hosts /etc/host  |& cat -n
     1  ==> /etc/passwd <==
     2  root:x:0:0:root:/root:/bin/bash
     3
     4  ==> /etc/hosts <==
     5  127.0.0.1   localhost localhost.localdomain localhost4 localhost4.localdomain4
     6  head: cannot open ‘/etc/host’ for reading: No such file or directory
[vagrant@localhost ShellScripting]$

Send output to STDERR:
echo "This is standard error " >&2

  head -n1 /etc/passwd /etc/hosts /etc/host > /dev/null
  head -n1 /etc/passwd /etc/hosts /etc/host 2> /dev/null
  head -n1 /etc/passwd /etc/hosts /etc/host &> /dev/null
Send stdout, stderr, and both to /dev/null

# COMMAND &> FILE                                                                     
# COMMAND |& COMMAND 
# COMMAND < FILE
# COMMAND > /dev/null


function:
func() {} or function func {}
local VARIABLE -> Inside function
readonly VARIABLE=value => Readonly variable - cannot be changed duration of the script
logger -> Send to syslog as a message
logger -t <tag> <msg>


# vls options, l needs argument so l:                                                
 while getopts vl:s OPTION                                                             
do                                                                                      
case ${OPTION} in                                                                       
v)                                                                                      
VERBOSE="true"                                                                       
log "Verbose on"                                                                      ;;                                                                                  
l)  

Math operations:
NUM=$(( 1 + 2 )) => arithmetic expansion, no floating point arithmatic

bc => calculator 
echo '6 / 4' | bc -l
bc -l => Do calc and the press CTRL+D

[vagrant@localhost ShellScripting]$ echo '6/4' | bc -l
1.50000000000000000000
[vagrant@localhost ShellScripting]$ awk 'BEGIN {print 6/4}'
1.5
[vagrant@localhost ShellScripting]$

[vagrant@localhost ShellScripting]$ DICEA='3'
[vagrant@localhost ShellScripting]$ DICEB='6'
[vagrant@localhost ShellScripting]$ NUM=$(( DICEA + DICEB ))
[vagrant@localhost ShellScripting]$ echo ${NUM}
9
[vagrant@localhost ShellScripting]$

[vagrant@localhost ShellScripting]$ NUM=1
[vagrant@localhost ShellScripting]$ (( NUM++ ))
[vagrant@localhost ShellScripting]$ echo ${NUM}
2
[vagrant@localhost ShellScripting]$

let command:
[vagrant@localhost ShellScripting]$ let NUM="2 + 3"
[vagrant@localhost ShellScripting]$ echo ${NUM}
5
[vagrant@localhost ShellScripting]$ let NUM++
[vagrant@localhost ShellScripting]$ echo ${NUM}
6
[vagrant@localhost ShellScripting]$

[vagrant@localhost ShellScripting]$ expr 1 + 2
3
[vagrant@localhost ShellScripting]$ NUM=$(expr 2 + 3)
[vagrant@localhost ShellScripting]$ echo ${NUM}
5
[vagrant@localhost ShellScripting]$

Getopts and case to process each option.
Use : to take the argument in optstring
getopts optstring <OPTIONS> => option in <OPTIONS> variable

Find files in system:
locate <>
Create local file
locate <local_file>
sudo updatedb
locate <local_file> => It will find now
locate .bashrc => allowed to see only permitted files

[vagrant@localhost ShellScripting]$ ls -l /root/.bashrc
ls: cannot access /root/.bashrc: Permission denied
[vagrant@localhost ShellScripting]$ sudo !!
sudo ls -l /root/.bashrc
-rw-r--r--. 1 root root 176 Dec 28  2013 /root/.bashrc
[vagrant@localhost ShellScripting]$

ls -ld /*bin => directory only listing -d

find <PATH> <OPTION/EXPR/SEARCH_PATTERN>
[vagrant@localhost ShellScripting]$ find /usr/sbin -name userdel
/usr/sbin/userdel
[vagrant@localhost ShellScripting]$

find / -name userdel
You get errors
find / -name userdel 2> /dev/null
sudo find / -name userdel 2> /dev/null

user900:x:1009:1010:UserID900:/home/user900:/bin/bash
[root@localhost ~]# sudo userdel user900
[root@localhost ~]# id user900
id: user900: no such user
[root@localhost ~]# id user800
uid=1008(user800) gid=1009(user800) groups=1009(user800)
[root@localhost ~]# ls /home/user900/
[root@localhost ~]#

[root@localhost ~]# ls -l /home/
total 40
drwx------  2 user100 user100 4096 Jan  1 04:43 user100
drwx------  2 user200 user200 4096 Jan  1 04:54 user200
drwx------  2 user300 user300 4096 Jan  1 05:16 user300
drwx------  2 user400 user400 4096 Jan  1 05:23 user400
drwx------  2 user500 user500 4096 Jan  1 09:32 user500
drwx------  2 user600 user600 4096 Jan  1 09:36 user600
drwx------  2 user700 user700 4096 Jan  1 10:53 user700
drwx------  2 user800 user800 4096 Jan  1 10:56 user800
drwx------  2    1009    1010 4096 Jan  1 10:57 user900
drwx------. 4 vagrant vagrant 4096 Jan  1 12:31 vagrant
[root@localhost ~]#

Tar: Tape and Archive
mkdir catvideos
touch catvideos/test1.mp4
touch catvideos/test2.mp4
touch catvideos/test3.mp4
touch catvideos/check1.mp4
touch catvideos/check2.mp4
touch catvideos/c2.mp4
ls catvideos/
tar -cf catvideos.tar catvideos/
ls -lrth
history
tar -tf catvideos.tar
tar -tvf catvideos.tar
tar -zcvf catvideos1.tar.gz catvideos/
tar -zxvf catvideos1.tar.gz
tar removes absolute path and it avoid overwriting system files

chage - To expire an account
[vagrant@localhost ShellScripting]$ sudo chage -E 0 user101
[vagrant@localhost ShellScripting]$ su - user101
Password:
Your account has expired; please contact your system administrator
su: User account has expired
[vagrant@localhost ShellScripting]$
[vagrant@localhost ShellScripting]$ sudo chage -E -1 user101 => Unlock

[vagrant@localhost ShellScripting]$ sudo usermod -s /sbin/nologin user101
[vagrant@localhost ShellScripting]$ su - user101
Password:
Last login: Fri Jan  1 14:28:59 EST 2021 on pts/0
This account is currently not available.
[vagrant@localhost ShellScripting]$
Still SSH can work and port forwarding would work

userdel, userdel -r
chage -E 0, chage -E -1

Cut Command:
cut -c 1 => character
cut -c 7 => 7 th character
cut -c 4-7 => Range char option
cut -c 4- => From 4th char till end
cut -c -4 => From 1 to 4
cut -c 1,3,5 => particular char
cut -c 3,5,1 => does not rearrange so same output like above
cut -c 9999 => Just blank if can't find
 
cut -b => bytewise char

cut -f => field wise cut
cut -f => By default tab is field
[vagrant@localhost ShellScripting]$ echo -e "one\ttwo\tthree" | cut -f 2-3
two     three
[vagrant@localhost ShellScripting]$
 echo "one,two,three" | cut -d ',' -f 2
-d for delimiter

Regex:
grep '<>' file
grep '^str' file - start
grep 'str$' file - end

[vagrant@localhost ShellScripting]$ grep -v '^first,last$' people.csv  | cut -d ',' -f 1
John
firstly
test
[vagrant@localhost ShellScripting]$

awk
awk -F 'DATA:' '{print $2}' file 
 -F -> Field seperator
print $2 -> Print the matched

awk -F ':' '{print $1, $3}' /etc/passwd => , here gives space between the seperator string else both are  joined


awk -F ':' -v OFS=',' '{print $1, $3}' /etc/passwd 
-v OFS=',' => Output Field Seperator 

awk -F ':' '{print $1 ", " $3}' /etc/passwd => ", " separator

awk -F ':' '{print $3 ", " $1}' /etc/passwd => Order can be changed unlike cut command
 awk -F ':' '{print $NF}' /etc/passwd => Last entry
 awk -F ':' '{print $(NF - 1)}' /etc/passwd
 awk '{print $1 $2}'  => default delimiter is TAB/WhiteSpace

[vagrant@localhost ShellScripting]$ netstat -nutl | grep ':' | awk '{print $4}' | awk -F ':' '{print $NF}'
22
25
[vagrant@localhost ShellScripting]$


sort:
sort /etc/passwd
sort -r /etc/passwd
sort -n => Numeric sort
 sudo du /var/ | sort -n
sort -h => Human readable number sorting - K,M,G bytes
sort -k => sort 
 cat /etc/passwd | sort -t ':' -k 3 -n


 netstat -nutl | grep ':' | awk '{print $4}' | awk -F ':' '{print $NF}' | sort -nu => nu : Unique option

uniq command expects to be in sorted entry
 netstat -nutl | grep ':' | awk '{print $4}' | awk -F ':' '{print $NF}' | sort -n | uniq
uniq -c => Count and tell us about the counters - how many duplicates

Mix: sudo cat /var/log/messages  | awk '{print $5}' | sort | uniq -c | sort -n

wc command:
line, word, character

sed:
sed 's/<>/<rep_text>/'  <file> s/=> Substitution
[vagrant@localhost ShellScripting]$ cat manager.txt
Ram is the assistant manager
[vagrant@localhost ShellScripting]$ sed 's/assistant/assistant to the regional/' manager.txt
Ram is the assistant to the regional manager
[vagrant@localhost ShellScripting]$

sed 's/search-pattern/replacement-string/flags' <file>
[vagrant@localhost ShellScripting]$ sed 's/ASSISTANT/assistant to the regional/' manager.txt
Ram is the assistant manager
[vagrant@localhost ShellScripting]$ sed 's/ASSISTANT/assistant to the regional/i' manager.txt
Ram is the assistant to the regional manager
[vagrant@localhost ShellScripting]$ sed 's/ASSISTANT/assistant to the regional/I' manager.txt
Ram is the assistant to the regional manager
[vagrant@localhost ShellScripting]$

sed 's/<>/<>/<NUM> => which occorance to replace or use g for global

sed -i.bak 's/<>/<>/' file => -i.bak creates a backup - inplace replacement in file.

sed 's/love/like/gw like.txt' love.txt => w flag to write replaced line to a file

[vagrant@localhost ShellScripting]$ echo '/home/sathish/'
/home/sathish/
[vagrant@localhost ShellScripting]$ echo '/home/sathish/' | sed 's/\/home\/sathish/\/export\/users\/sathish/'
/export/users/sathish/
[vagrant@localhost ShellScripting]$

 echo '/home/sathish/' | sed 's#/home/sathish#/export/users/sathish#' => Use any delimiter after s flag to avoid escaping

Line removal:
sed '/<>/d' <file> => d for delete the line of matched pattern 

 sed '/^#/d' luser-demo05.sh | sed '/^$/d'
can be written as
sed '/^#/d ; /^$/d' luser-demo05.sh => separate the command with ;
 sed -e '/^#/d' -e '/^$/d' -e 's/PASSWORD/password/' luser-demo05.sh => Use -e also

[vagrant@localhost ShellScripting]$ sed '3 s/love/like/' love.txt => ' ADDRESS ' for line addressing
I love my wife
This is line 2
I like my wife with all of my heart
I love my wife and my wife loves me. Also, my wife loves the cat.
[vagrant@localhost ShellScripting]$

[vagrant@localhost ShellScripting]$ sed '/cat/ s/love/like/' love.txt => Change only the first matched(cat here) lines
I love my wife
This is line 2
I love my wife with all of my heart
I like my wife and my wife loves me. Also, my wife loves the cat.
[vagrant@localhost ShellScripting]$

[vagrant@localhost ShellScripting]$ sed '1,3 s/love/like/' love.txt => Accept range as well
I like my wife
This is line 2
I like my wife with all of my heart
I love my wife and my wife loves me. Also, my wife loves the cat.
[vagrant@localhost ShellScripting]$

Some Networking:
[vagrant@admin01 ~]$ for N in 1 2
> do
>   ssh server0${N} hostname
> done
server01
server02
[vagrant@admin01 ~]$

[vagrant@admin01 ~]$ cat servers
server01
server02
[vagrant@admin01 ~]$ for SERVER in $(cat servers)
> do
>   ssh ${SERVER} hostname
>   ssh ${SERVER} uptime
> done
server01
 00:37:18 up 7 min,  0 users,  load average: 0.00, 0.03, 0.04
server02
 00:37:19 up 6 min,  0 users,  load average: 0.00, 0.03, 0.04
[vagrant@admin01 ~]$ ssh server01 hostname ; hostname
server01
admin01
[vagrant@admin01 ~]$ ssh server01 hostname ; hostname^C
[vagrant@admin01 ~]$ ssh server01 'hostname ; hostname'
server01
server01
[vagrant@admin01 ~]$

[vagrant@admin01 ~]$ CMD='hostname'
[vagrant@admin01 ~]$ CMD1='uptime'
[vagrant@admin01 ~]$ ssh server01 "$CMD ; $CMD1"
server01
 00:39:09 up 9 min,  0 users,  load average: 0.00, 0.02, 0.04

[vagrant@admin01 ~]$ ssh server01 'set -o pipefail; false | true'
[vagrant@admin01 ~]$ echo ${?}
1
[vagrant@admin01 ~]$
man set

```
