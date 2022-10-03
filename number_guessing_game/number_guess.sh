#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=number_guess --tuples-only -c"

echo -e "\n~~~Number Guessing Game~~~\n"

# get the secret number
RANDOM_NUMB=$(( $RANDOM % 1000 + 1 ))
REGEX='^([1-9][0-9]{0,2})$'
# get user info
echo -e "\nEnter your username:"
read USERNAME
USER_INFO=$($PSQL "SELECT username, games_played, best_game FROM users FULL JOIN games USING(user_id) WHERE username='$USERNAME' ")
USER_ID=$($PSQL "SELECT user_id FROM users FULL JOIN games USING(user_id) WHERE username='$USERNAME' ")
GAMES_PLAYED_COUNT=$($PSQL "SELECT games_played FROM users FULL JOIN games USING(user_id) WHERE username='$USERNAME' ")
BEST_GAME_STAT=$($PSQL "SELECT best_game FROM users FULL JOIN games USING(user_id) WHERE username='$USERNAME' ")
CURRENT_STAT=0

# if not found
if [[ -z $USER_INFO ]] 
then
# insert new user
INSERT_USER=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME')")
echo -e "\nWelcome, $USERNAME! It looks like this is your first time here."
USER_ID=$($PSQL "SELECT user_id FROM users FULL JOIN games USING(user_id) WHERE username='$USERNAME' ")
INSERT_ID_TO_GAMES=$($PSQL "INSERT INTO games(user_id) VALUES($USER_ID)")
BEST_GAME_STAT=999
else
echo $USER_INFO
echo $USER_INFO | while read NAME BAR GAMES_PLAYED BAR BEST_GAME
do
if [[ -z $BEST_GAME ]]
then
echo -e "\nWelcome back, $NAME! You have played $BAR games, and your best game took $BEST_GAME guesses."
else
echo -e "\nWelcome back, $NAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi
done
fi
BEST_GAME_STAT=999
echo -e "\nGuess the secret number between 1 and 1000:"

MAIN_MENU(){

read NUMB
if  [[ ! $NUMB =~ $REGEX ]]
then  
CURRENT_STAT=$(( $CURRENT_STAT + 1 ))
echo "That is not an integer, guess again:"
read NUMB
fi

if [[ $NUMB -gt $RANDOM_NUMB ]]
then
CURRENT_STAT=$(( $CURRENT_STAT + 1 ))
echo -e "\nIt's lower than that, guess again:"
MAIN_MENU 
elif [[ $NUMB -lt $RANDOM_NUMB ]]
then
CURRENT_STAT=$(( $CURRENT_STAT + 1 ))
echo -e "\nIt's higher than that, guess again:"
MAIN_MENU 
elif [[ $NUMB == $RANDOM_NUMB ]]
then
CURRENT_STAT=$(( $CURRENT_STAT + 1 ))
echo -e "\nYou guessed it in $CURRENT_STAT tries. The secret number was $RANDOM_NUMB. Nice job!"
  if [[ -z $GAMES_PLAYED_COUNT ]]
  then
  GAMES_PLAYED_COUNT=1
  else
  GAMES_PLAYED_COUNT=$(( $GAMES_PLAYED_COUNT+1 ))
  fi
  if [[ $CURRENT_STAT -lt $BEST_GAME_STAT ]]
  then
  UPDATE_RESULT=$($PSQL "UPDATE games SET games_played=$GAMES_PLAYED_COUNT, best_game=$CURRENT_STAT WHERE user_id=$USER_ID")
  else
  UPDATE_RESULT=$($PSQL "UPDATE games SET games_played=$GAMES_PLAYED_COUNT, best_game=$BEST_GAME_STAT WHERE user_id=$USER_ID").
  exit
  fi
fi

}

MAIN_MENU