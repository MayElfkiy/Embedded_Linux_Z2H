#!/bin/bash
clear
if [ -e ~/TRASH ] 	#checks if the directory exists
then
  :
else 
  mkdir -p ~/TRASH	#create the directory
  chmod 777 ~/TRASH	
  (crontab -l 2>/dev/null; echo "*/30 * * * * sdel.sh") | crontab -  #adding the script to cron to run automatically
fi

find ~/TRASH -type f -mtime +2 -exec rm -f {} \; 	#remove files older than 2 days

for fileN in "$@"
do
if file $fileN.gz | grep -q "compressed data"; then 	#check whether the file is already compressed
	echo "file $fileN is already zipped" 
else
	gzip $fileN.*					#compress file
fi
mv $fileN.gz ~/TRASH					#move file to trash
done
