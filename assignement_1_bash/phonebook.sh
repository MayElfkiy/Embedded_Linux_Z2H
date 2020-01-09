#!/bin/bash
clear

if [ -e phonebook.txt ]
then 
	:
else
	touch phonebook.txt
fi


if [ "$1" = "-i" ]
then
	echo $2 $3 $4 >> phonebook.txt
elif [ "$1" = "-v" ]
then
	cat phonebook.txt
elif [ "$1" = "-s" ]
then
grep "$2" phonebook.txt
elif [ "$1" = "-d" ]
then
sed -i "/$2/c\ " phonebook.txt
sed -r '/^\s*$/d' phonebook.txt
#grep -rl "$2" phonebook.txt | xargs sed -i '' phonebook.txt
#grep "$2" phonebook.txt | sed -i 'c\' phonebook.txt
# | sed -i 'c\' phonebook.txt
#sed -ri -e "c/''/''" $(grep -Elr --binary-files=without-match "$2" "phonebook.txt")
elif [ "$1" = "-e" ]
then
cat /dev/null > phonebook.txt
else
	echo "-i: insert new entry"
	echo "-v: view all"
	echo "-s: insert new entry"
	echo "-d: insert new entry"
	echo "-e: remove everything"
	echo "no option: shows all options available"
fi
