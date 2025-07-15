#!/bin/bash

<<disclaimer
This is a shell script 
to create users
disclaimer

username=$1

echo "==============deletion of user started============="

sudo userdel  "$1"

echo "================deletion of user completed ========="

#Confirmation of user deletion

output=$(cat /etc/passwd | grep $username | wc)

echo "user $username is deleted"
echo "Proof is $output"

