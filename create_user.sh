#!/bin/bash


<<disclaimer
This is a shell script 
to create users
disclaimer

echo "==============creation of user started============="

read -p "Enter the username" username
read -p "Enter the password" password

sudo useradd -m  "$username"

echo -e "$password\n$password" |sudo passwd "$username"

echo "================creation of user completed ========="

