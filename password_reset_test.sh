#!/bin/bash

read -p "enter username to change password ": username
read -p "enter new password for $username ": password

echo -e "$password\n$password" | sudo passwd "$username"


