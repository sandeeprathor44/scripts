#!/bin/bash
#
<<info 
This shell script will take priodic backup for script folder
info


src=$1
dest=$2

timestamp=$(date '+%Y-%m-%d %H:%M:%S')

zip -r "$dest/backup-$timestamp.zip" "$src" >> /dev/null

find $dest -maxdepth 1 -type f -printf '%Ts\t%p\n' | sort -n | head -n -3 | cut -f 2- | xargs -d '\n' rm -rf #Deleting old files from disk only

if [ $? -eq 0 ];
        then
	echo "backup completed and uploaded to S3 successfully also purging a"

fi

aws s3 sync "$dest" s3://tws-scripts-backups

#Deleting file from S3 bucket as well

aws s3api list-objects-v2 --bucket tws-scripts-backups --query "Contents[].[LastModified, Key]" --output text | \sort | head -n -3 | awk '{print $2, $3}' | 
	while read -r key; do   
		aws s3 rm "s3://tws-scripts-backups/$key"; 
	done
