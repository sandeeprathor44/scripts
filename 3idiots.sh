#!/bin/bash

hero="rancho"
villain="virus"

#user defined variables
echo "3 idiots ka hero hai $hero"
echo "3 idiots ka villain hai $villain"

#Shell/Env variables (pre-defined variable)

echo "Current logged in user $USER"


#user defined varirable input by user

read -p "rancho ka pura name kya tha? " fullname

echo "rancho ka pura name $fullname tha"

#arguments

# ./3idiots.sh raju farhan rancho

echo "movie ka name: "$0
echo "first idiot:" $1
echo "second idiot: "$2
echo "Third idiot: " $3

echo "Hench 3 idiots are $@"3

echo "total number of idiots" $#
