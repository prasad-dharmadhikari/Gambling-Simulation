#!/bin/bash -x

#Constants
BET=1
#Variables
stake=100
win=0
lose=0
randomCheck=0
counter=1
halfStake=$(($stake/2))
winCondition=$((stake+halfStake))
loseCondition=$((stake-halfStake))
echo "Welcome to gambling simulation"
#Generate two random values
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
echo "You resigned for the day"
echo "Updated stake:$stake"
