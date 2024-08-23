#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

READ_INPUT(){ 
echo Enter your username:
read USERNAME

ENTERED_NAME=${#USERNAME}

if [[ ! $ENTERED_NAME -le 22 ]] || [[ ! $ENTERED_NAME -gt 0 ]]
then
  echo -e "Please, enter a username between 0 and 22 characters\n"
  READ_INPUT
else

NAME=$($PSQL "SELECT username FROM players WHERE username = '$USERNAME';" | sed 's/ //g')
ID=$($PSQL "SELECT user_id FROM players WHERE username = '$USERNAME';" | sed 's/ //g')                
if [[ -z $NAME ]]
then
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  NEW_USERNAME=$($PSQL "INSERT INTO players(username) VALUES('$USERNAME');")
else
  GAMES_PLAYED=$($PSQL "SELECT COUNT(game_id) FROM games LEFT JOIN players USING(user_id) WHERE username='$USERNAME'")
  BEST_GAME=$($PSQL "SELECT MIN(number_of_guesses) FROM games LEFT JOIN players USING(user_id) WHERE username='$USERNAME'")
  
  echo Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses.
fi

SECRET_NUMBER=$(( RANDOM  % 1000 + 1 ))
COUNTING_GUESS=0

echo "Guess the secret number between 1 and 1000:"
read GUESS

until  [[ $GUESS = $SECRET_NUMBER ]]
do

if [[ ! $GUESS =~ ^[0-9]+$ ]]
then
  echo -e "\nThat is not an integer, guess again:"
  read GUESS
  ((COUNTING_GUESS++))
else
  if [[ $GUESS < $SECRET_NUMBER ]]
  then
  echo "It's higher than that, guess again:"
  read GUESS
  ((COUNTING_GUESS++))

  else 
  echo "It's lower than that, guess again:"   
  ((COUNTING_GUESS++))
  read GUESS
      fi  
  fi

done

((COUNTING_GUESS++))

USER_ID_RESULT=$($PSQL "SELECT user_id FROM players WHERE username='$USERNAME'")
# add result to game history/database
INSERT_GAME_RESULT=$($PSQL "INSERT INTO games(user_id, secret_number, number_of_guesses) VALUES ($USER_ID_RESULT, $SECRET_NUMBER, $COUNTING_GUESS)")

# winning message
echo You guessed it in $COUNTING_GUESS tries. The secret number was $SECRET_NUMBER. Nice job\!

fi

}

READ_INPUT