#!/bin/bash
#Employee wage calculation program

echo "***WELCOME TO EMPLOYEE WAGE CALCULATION PROGRAM***"

isPresent=1
isFullTime=1
isPartTime=2
randomCheck=$(($RANDOM%2));
empCheck=$(($RANDOM%2));

#1.employee absent or present check
if [ $isPresent -eq $randomCheck ]
then
	echo "Employee is present"
else
	echo "Employee is absent"
fi


#2.calculating daily employee wage
if [ $isPresent -eq $randomCheck ]
then
        empRatePerHr=20
	empHrs=8
	salary=$(($empHrs*$empRatePerHr))
	echo "SALARY "$salary
else
        salary=0
	echo "SALARY "$salary
fi

#3.calculating Part time Employee & Wage
if [ $isFullTime -eq $randomCheck ]
then
	empHrs=8
elif [ $isPartTime -eq $randomCheck ]
then
        empHrs=4
else
	empHrs=0
fi

salary=$(($empRatePerHr*$empHrs))
echo "PART TIME SALARY "$salary
