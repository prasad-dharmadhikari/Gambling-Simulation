#!/bin/bash -x

#Constants
BET=1
#Variables
win=0
lose=0
randomCheck=0
counter=1
day=1
noOfDays=20
tempStake=100
tempStake2=100
echo "Welcome to gambling simulation"
#Generate two random values
for((day=1;day<=20;day++))
do
	stake=100
	halfStake=$(($stake/2))
	winCondition=$((stake+halfStake))
	loseCondition=$((stake-halfStake))
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
	case $stake in
		$winCondition)
			echo "You won for the day $day"
			echo "Total win amount:"$halfStake
			printf "\n"
		;;
		$loseCondition)
			echo "You lost for the day $day"
			echo "Total lost amount:"$halfStake
			printf "\n"
		;;
	esac
done
echo ${stakeWinOrLoseArray[@]}

