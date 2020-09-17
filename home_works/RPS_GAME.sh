#!/bin/bash

# -lt
# -le
# -gt
# -ge
# -ne !=
# -eq  =

help="Enter:\n\n- stone\n- paper\n- scissors"


while true
do

lie=$((RANDOM%100))
computer_value=$((RANDOM%3))

echo -e $help
read user_value

if [ "$user_value" = "stone" ]
then
user_value=0

elif [ "$user_value" = "paper" ]
then
user_value=1

elif [ "$user_value" = "scissors" ]
then
user_value=2
else
echo "Input ERROR!"
continue

fi

if [ $lie -le 56 ]
then
echo "I will be win!" 
if [ $user_value = 0 ]
then 
computer_value=1

elif [ $user_value = 1 ]
then
computer_value=2

elif [ $user_value = 2 ]
then
computer_value=0
fi 
fi

if [[ $computer_value = 0 ]] && [[ $user_value = 2 ]]
then 
echo "You Lose!"

elif [[ $computer_value = 0 ]]  && [[ $user_value = 1 ]]
then 
echo "You Win!"
exit

elif [[ $computer_value = 1 ]] && [[ $user_value = 2 ]]
then
echo "You Win!"
exit

elif [[ $computer_value = 1 ]] && [[ $user_value = 0 ]]
then
echo "You Lose!"

elif [[ $computer_value = 2 ]] && [[ $user_value = 1 ]]
then
echo "You Lose!"

elif [[ $computer_value = 2 ]] && [[ $user_value = 0 ]]
then
echo "You Win!"
exit

else  
echo "Draw!"

fi
done
