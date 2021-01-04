# Regular Expressions (regex)
Ruby, Java, Python, JS, Linux </br>
A regular expre or regex or regexp is a sequence of characters that define a search pattern - Wikipedia </br>

## Use Cases:
Form validation - Password validation during Google account creation </br>
Notepad++/Bbedit - CSV file (comma separated values) - regular expression mode during search </br>

## Basic Set:
    * - Zero or more occurrence of the character that precedes this asterisk
    . - A wildcard that represent any character
    \s - Represent white space
    [pqr] - A single character which can be either 'p', 'q' or an 'r' => character class
    [a-d] - A single character that falls in the range a-d
    [^pq] - A single character that is neither p or q => negation
    ^pattern - ^ is an anchor tag - beginning of the line
    pattern$ - End of the line

## Extended Set:
    + => One or more occurrence of the character that precedes this + symbol
    ? => Zero or more occurrence of the character that precedes this ? symbol
    pat1|pat2 => Match either the pattern pat1 or the pattern pat2
    () => Divides patterns into group
    {m} => Exactly 'm' occurrences of whatever precedes
    {m,n} => Atleast m and at most n occurrences of whatever precedes. Only one of m, n is mandatory. Others can be blank.

## Examples
```
Pasting history here. Some might have failed but it is useful for quick recollection.
grep 'fooa*bar' regex.txt
grep 'foox*bar' regex.txt
grep 'foox+bar' regex.txt
grep 'foox?bar' regex.txt
grep 'foox*bar' regex.txt
grep 'foo.bar' regex.txt
grep 'foo*bar' regex.txt
grep 'foo***bar' regex.txt
grep 'foo.*bar' regex.txt
grep 'foo*bar' regex.txt
grep 'fooa*bar' regex.txt
grep 'foo\s*bar' regex.txt
grep 'foo/\s*bar' regex.txt
grep "foo\s*bar" regex.txt
grep 'foo\s*bar' regex.txt
grep '[fcl]oo' regex.txt
grep '[a-z]oo' regex.txt
grep '[a-d]oo' regex.txt
grep '[a-d]oo' regex.txt  | sort
grep '[a-d]oo' regex.txt  | sort | cut -c1
grep '[a-d]oo' regex.txt  | sort | cut -c2
grep '[a-d]oo' regex.txt  | sort | cut -c2 -u
grep '[a-d]oo' regex.txt  | sort | cut -c2 | uniq
grep '[fcdplb]oo' regex.txt
grep '[^mh]oo' regex.txt
grep '[j-m]oo' regex.txt
grep '[j-m]zoo' regex.txt
grep '[j-mz]oo' regex.txt
grep '[zj-m]oo' regex.txt
grep '[j-mJ-Mz]oo' regex.txt
grep 'x*\.y*' regex.txt
grep 'x[#:.]y' regex.txt
grep 'x[#:\^]y' regex.txt
grep 'x[#\\\^]y' regex.txt
grep '^foo' regex.txt
grep '^foo.*' regex.txt
grep '^foo' regex.txt
grep '^foo.*' regex.txt
grep 'bar$' regex.txt
grep '.*bar$' regex.txt
grep '.*bar$' regex.txt
grep '.*bar$' regex.txt
grep -E '.*bar$' regex.txt
grep -o '.*bar$' regex.txt
grep -P '.*bar$' regex.txt
grep -oP '.*bar$' regex.txt
grep '.*bar$' regex.txt
grep '^foo' regex.txt
grep '.*bar$' regex.txt
grep 'bar$' regex.txt
grep '.*bar$' regex.txt
grep 'bar$' regex.txt
grep '.*bar$' regex.txt
grep '^foo' regex.txt
grep -E '.*bar$' regex.txt
grep -E '.*bar$' regex.txt
grep -E 'bar$' regex.txt
grep -E 'bar$' regex.txt
grep '^foo$' regex.txt
grep '^[0-9][0-9][0-9]$' regex.txt
grep '^[0-9][0-9][0-9]$' regex.txt
grep '^[0-9]{3}$' regex.txt
grep '^[0-9]{3}$' regex.txt
grep '^[0-9][0-9][0-9]$' regex.txt
grep -E '^[0-9]{3}$' regex.txt
grep -E '^[a-z]{4,6}$' regex.txt
grep -E 'ha{4,9}' regex.txt
grep -E '^{ha}{4,9}' regex.txt
grep -E '^(ha){4,9}' regex.txt
grep -E '^(ha){4,}' regex.txt
grep -E '^(ha){1,2}' regex.txt
grep -E '^(ha){1,2}$' regex.txt
grep -E '^(ha){,2}$' regex.txt
grep -E '^fooa+bar$' regex.txt
grep -E '^fooa+bar$' regex.txt
grep -E '^https?:' regex.txt
grep -E '^https*:' regex.txt
grep -E '(log|ply)wood$' regex.txt
grep -E '([0-9]+)x([0-9]+)' regex.txt
sed -r 's/([0-9]+)x([0-9]+)/\1 pix x \2 pix/g' regex.txt
sed -r 's/([a-z]+)\s([a-z]+)/\2 \1/g' regex.txt
sed -r 's/([a-z]+)\s([a-z]+)/\2,\1/g' regex.txt
sed -r 's/([a-zA-Z]+)\s([a-zA-Z]+)/\2,\1/g' regex.txt
sed -r 's/([0-9]+):([0-9]+)/\2 mins past \1' regex.txt
sed -r 's/([0-9]+):([0-9]+)/\2 mins past \1/' regex.txt
sed -r 's/([0-9]+):([0-9]+)/\2 mins past \1/g' regex.txt
sed -r 's/([0-9]{1,2}):([0-9]{2})/\2 mins past \1/g' regex.txt
sed -r 's/[0-9]{3}\.[0-9]{3}\.([0-9]{3})/xxx.xxx.\1/g' regex.txt
sed -r 's/([a-zA-Z]{3})\s([0-9]{1,2})[a-z]{2}\s[0-9]{2}([0-9]{2})/\2-\1-\3/g' regex.txt
sed -r 's/\(([0-9]{3})\)\.([0-9]{3})\.([0-9]{4})/\1.\2.\3/g' regex.txt
sed -r 's/\(([0-9]{3})\)\.([0-9]{3}\.([0-9]{4})/\1.\2.\3/g' regex.txt
sed -r 's/\(([0-9]{3})\)\.([0-9]{3}\.[0-9]{4})/\1.\2.\3/g' regex.txt
sed -r 's/\(([0-9]{3})\)(\.[0-9]{3}\.[0-9]{4})/\1.\2.\3/g' regex.txt
sed -r 's/\(([0-9]{3})\)(\.[0-9]{3}\.[0-9]{4})/\1.\2/g' regex.txt
sed -r 's/\(([0-9]{3})\)(\.[0-9]{3}\.[0-9]{4})/\1\2/g' regex.txt
```
