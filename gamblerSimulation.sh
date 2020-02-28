#!/bin/bash -x

#Constants
BET=1
#Variables
win=0
day=1
lose=0
counter=1
noOfDays=20
countDay=1
tempStake=100
randomCheck=0
winCounter=0
#declare -a stakeWinOrLoseArray

#Function to play gambling for a month
function playGamblingForMonth()
{
	# For loop to play for 20 days
	for((day=1;day<=$noOfDays;day++))
	do
		stake=100
		halfStake=$(($stake/2))
		winCondition=$((stake+halfStake))
		loseCondition=$((stake-halfStake))
		# Condition for win or loss 50% of stake
		while(( $stake!=$winCondition && $stake!=$loseCondition ))
		do
			randomCheck=$((RANDOM%2))
			case $randomCheck in
				0)
					((lose++))
					stake=$((stake-BET))
				;;
				1)
					((win++))
					stake=$((stake+BET))
				;;
			esac
		done
		# Case statement to print the lost day and win day with total amount
		case $stake in
			$winCondition)
				echo "You won for the day $day"
				echo "Total win amount:"$halfStake
				((winCounter++))
				printf "\n"
				tempStake=$((tempStake+halfStake))
				stakeWinOrLoseArray[$((counter++))]=$tempStake
			;;
			$loseCondition)
				echo "You lost for the day $day"
				echo "Total lost amount:"$halfStake
				((lostCounter++))
				printf "\n"
				tempStake=$((tempStake-halfStake))
				stakeWinOrLoseArray[$((counter++))]=$tempStake
			;;
		esac
	done
}
# Function to Dispaly records of a month 
function printDailyWinOrLostRecords()
{
	echo "Your monthly record is :"
	# For loop to print 
	for value in ${!stakeWinOrLoseArray[@]}
	do
		echo "day $value:${stakeWinOrLoseArray[$value]}"
	done
	echo "No of days you lost:" $lostCounter
	echo "You lost by:" $((lostCounter*halfStake))
	echo "No of days you won:" $winCounter
	echo "You won by:" $((winCounter*halfStake))
}
function getLuckiestAndUnluckiestDay()
{
	maximumMoneyWon=${stakeWinOrLoseArray[1]}
	maximumMoneyLost=${stakeWinOrLoseArray[1]}
	for money in ${stakeWinOrLoseArray[@]}
	do
		if [[ $money -lt $maximumMoneyLost ]]
		then
			maximumMoneyLost=$money
		elif [[ $money -gt $maximumMoneyWon ]]
		then
			maximumMoneyWon=$money
		fi
	done
	for countDay in ${!stakeWinOrLoseArray[@]}
	do
		if [[ ${stakeWinOrLoseArray[countDay]} -eq $maximumMoneyLost ]]
		then
			echo "Unluckiest day: "${countDay}
		elif [[ ${stakeWinOrLoseArray[countDay]} -eq $maximumMoneyWon ]]
		then
			echo "Luckiest day: "${countDay}
		fi
	done
}

echo "Welcome to the game of gambling"
playGamblingForMonth
printDailyWinOrLostRecords
getLuckiestAndUnluckiestDay
