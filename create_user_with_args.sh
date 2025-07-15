#!/bin/bash


<<disclaimer
This is a shell script 
to create users through args
disclaimer

echo "==============creation of user started============="

#read -p "Ente rname" $1
#read -p "Enter the password" $2

sudo useradd -m  "$1"

echo -e "$2\n$2" |sudo passwd "$1"

echo "================creation of user completed ========="
