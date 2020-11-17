#!/bin/bash
#Employee wage calculation program

echo "***WELCOME TO EMPLOYEE WAGE CALCULATION PROGRAM***"

isPresent=1
isFullTime=1
isPartTime=2
max_hrs_in_month=10
empRatePerHr=20
numWorkingDays=20
totalSalary=0
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


#4.using case statement
case $empCheck in
	$isFullTime)
			empHrs=8;
			;;
	$isPartTime)
			empHrs=4;
			;;
	*)
			empHrs=0
			;;
esac
salary=$(($empHrs*$empRatePerHr))
echo "SALARY CALCULATION USING SWITCH CASE "$salary


#5.Calculating wages for month
for (( day=1; day<=$numWorkingDays; day++ ))
do
empCheck1=$((RANDOM%3));
case $empCheck1 in
        $isFullTime)
                        empHrs=8;
                        ;;
        $isPartTime)
                        empHrs=4;
                        ;;
        *)
                        empHrs=0
                        ;;
esac
salary=$(($empHrs*$empRatePerHr))
totalSalary=$(($totalSalary+$salary))
echo "SALARY FOR MONTH "$salary
echo "TOTAL SALARY "$totalSalary
done


#6.Calculate Wages till a condition of total working hours or days is reached for a month
totalEmpHr=0
totalWorkingDays=0
while [[ $totalEmpHr -lt $max_hrs_in_month &&
	 $totalWorkingDays -lt $numWorkingDays ]]
do
	((totalWorkingDays++))
	empCheck1=$(($RANDOM%3))
	case $empCheck1 in
	$isFullTime)
                        empHrs=8;
                        ;;
        $isPartTime)
                        empHrs=4;
                        ;;
        *)
                        empHrs=0
                        ;;
esac
totalEmpHr=$(($totalEmpHr+$empHrs))
done
totalSalary=$(($totalEmpHr+$empRatePerHr))

echo "--TOTAL EMPLOYEE HOURS "$totalEmpHr
echo "--TOTAL SALARY "$totalSalary
