#!/bin/bash -x

#Constants
BET=1
#Variables
stake=100
win=0
lose=0
randomCheck=0
counter=1
echo "Welcome to gambling simulation"
#Generate two randim values
randomCheck=$((RANDOM%2))
case $randomCheck in
	0) echo "You lost"
		((lose++))
		stake=$((stake-BET))
	;;
	1) echo "You won"
		((win++))
		stake=$((stake+BET))
	;;
esac
echo "updated stake:$stake"
