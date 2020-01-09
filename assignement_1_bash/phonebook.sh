#!/bin/bash
clear

if [ -e phonebook.txt ]
then 
	:
else
	touch phonebook.txt
fi
sed -r '/^\s*$/d' phonebook.txt

if [ "$1" = "-i" ]
then
	read -p 'insert name: ' varname
	read -p 'insert phone: ' varphone
	read -p 'insert email: ' varemail

	echo $varname : $varphone $varemail >> phonebook.txt

elif [ "$1" = "-v" ]
then
	cat phonebook.txt
elif [ "$1" = "-s" ]
then
read -p 'insert name: ' varname
grep "$varname" phonebook.txt
elif [ "$1" = "-d" ]
then
read -p 'insert name: ' varname

sed -i "/$varname :/c\ " phonebook.txt
sed -r '/^\s*$/d' phonebook.txt
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
