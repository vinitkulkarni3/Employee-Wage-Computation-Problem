#!/bin/bash
#Employee wage calculation program

echo "***WELCOME TO EMPLOYEE WAGE CALCULATION PROGRAM***"

isPresent=1
randomCheck=$(($RANDOM%2));

#1.employee absent or present check
if [ $isPresent -eq $randomCheck ]
then
	echo "Employee is present"
else
	echo "Employee is absent"
fi

