#! /bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

echo "Enter your username:"
read username

player=$($PSQL "select * from players where username ilike '$username'")

if [[ -z $player ]]
then
 echo "Welcome, $username! It looks like this is your first time here."
 # insert new player
 $($PSQL "insert into players(username) values('$username')")
 games_played=0
 best_game=0
else 
  IFS="|" read -r username games_played best_game <<< $player
  echo "Welcome back, $username! You have played $games_played games, and your best game took $best_game guesses."
fi

random=$(( $RANDOM % 1000 + 1 ))

GUESS(){
  if [[ $1 ]]
  then
    echo $1
  fi
  read guess
  if [[ ! $guess =~ ^[0-9]+$ ]]
  then
    GUESS "That is not an integer, guess again:" $2
  elif [[ $guess -gt $random ]]
  then
    GUESS "It's lower than that, guess again:"  $(( $2+1 ))
  elif [[ $guess -lt $random ]]
  then
   GUESS "It's higher than that, guess again:" $(( $2+1 ))
  else
    if [[ $best_game -eq 0 || $best_game -gt $2 ]]
    then
      update_best_gamme=$($PSQL "update players set best_game=$2 where username ilike '$username'")
    fi
    update_games_played=$($PSQL "update players set games_played=$games_played+1 where username ilike '$username'")
    echo You guessed it in $2 tries. The secret number was $random. Nice job!
  fi
}

GUESS "Guess the secret number between 1 and 1000:" 1