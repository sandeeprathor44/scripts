#!/bin/bash

<<Disclaimer
Execute this script with ./ only since sh will not working due to -e is being used
Disclaimer

action=$1

#Creating user
if [ $action = "-c" ] || [ $action = "-create" ];
	then
	       	read -p "Enter username to create : "  username	
		if id $username > /dev/null 2>&1; #Checking user if already exist
       	 	then
        	echo "$username already exist"
        	return 1
		else
		read -p "Enter password for $username : " password
		sudo useradd -m "$username" #Creating user
		echo -e "$password\n$password" |sudo passwd "$username" > /dev/null 2>&1 #Set password
		if [ $? -eq 0 ];
		then
		echo =======$username created successfully=======
		fi
		fi
fi

#Deleting user
if [ $action = "-d" ] || [ $action = "-delete" ];
	then
		read -p "Enter username to delete : "  username
		if ! id $username > /dev/null 2>&1; #Checking user does not exist
		then 
		echo "$username does not exist"
		return 1
		else
		sudo userdel -rf $username > /dev/null 2>&1 #Deleting user
	if [ $? -eq 0 ];
	then
		echo =======$username deleted successfully=======
	fi
		fi
fi

#Reset password
if [ $action = "-r" ] || [ $action = "-reset" ];
	then
		read -p "Enter username to change password : "  username
		if ! id $username > /dev/null 2>&1; #Checking user does not exist
                then
                echo =======$username does not exist=======
		else
		read -p "Enter new password for $username : "  password
		echo -e "$password\n$password" |sudo passwd "$username" > /dev/null 2>&1 #Set password
	if [ $? -eq 0 ];
	then    
                 echo =======$username password changed successfully=======
         fi      
          	fi
 fi

#List users

if [ $action = "-l" ] || [ $action = "-list" ];
then
	awk -F':' '{ print "Username:", $1,"\n\t" "User ID:", $3,"\n\t" "Home Directory:",  $6,"\n\t" "Shell:", $7 }' /etc/passwd
fi

#Help options

if [ $action = "-h" ] || [ $action = "-help" ];
then 


	echo -e "-c or -create 	= for creation of user \n-d or -delete 	= for deletion of user \n-r or -reset 	= for reset password for user \n-l or -list	= for listing of users"

fi
