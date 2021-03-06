#!/bin/bash
#Employee wage calculation program

echo "***WELCOME TO EMPLOYEE WAGE CALCULATION PROGRAM***"

isPartTime=1
isFullTime=2
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



#7.Refactor the code to write a function to get work hours
function getworkhours()
{
	empCheck1=$1
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

echo "--TOTAL EMPLOYEE HOURS FROM FUNCTION "$totalEmpHr
}
empCheck1=$(($RANDOM%3))
getworkhours $empCheck1



#8.Store the daily wage along with the total wage
totalEmpHrs=0
totalWorkingDays=0
max_hrs_in_month1=4

function getWorkHrs()
{
	empCheck2=$1
	case $empCheck2 in
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
	echo $empHrs
}
while [[ $totalEmpHrs -lt $max_hrs_in_month1 &&
         $totalWorkingDays -lt $numWorkingDays ]]
do
	((totalWorkingDays++))
	empCheck2=$(($RANDOM%3))
	empHrs="$( getWorkHrs $empCheck2 )"
	totalEmpHrs=$(($totalEmpHrs+$empHrs))
	ans=$(($empHrs*$empRatePerHr))
	arrDailyWage[$totalWorkingDays]=$ans
done
totalSalary=$(($totalEmpHrs+$empRatePerHr))
echo "Daily Wage is-> "${arrDailyWage[@]}



#9.store the day and the daily wage along with total wage
declare -A dailWageDict
totalEmpHrs=0
totalWorkingDays=0
max_hrs_in_month1=4

function getWorkHrs()
{
        empCheck2=$1
        case $empCheck2 in
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
        echo $empHrs
}

function getEmpWage()
{
	empHr=$1
	echo $(($empHr*$empRatePerHr))
}

while [[ $totalEmpHrs -lt $max_hrs_in_month1 &&
         $totalWorkingDays -lt $numWorkingDays ]]
do
        ((totalWorkingDays++))
        empCheck2=$(($RANDOM%3))
        empHrs="$( getWorkHrs $empCheck2 )"
        totalEmpHrs=$(($totalEmpHrs+$empHrs))
        #ans=$(($empHrs*$empRatePerHr))
        dailyWageDict[$totalWorkingDays]="$( getEmpWage $empHrs )"
done
totalSalary=$(($totalEmpHrs+$empRatePerHr))
echo "Daily Wage is dict-> "${dailyWageDict[@]}
echo "day "${!dailyWageDict[@]}
