#! /bin/bash
clear
if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi
# Do not change code above this line. Use the PSQL variable above to query your database.

added=0
$PSQL "truncate table teams, games"
cat games.csv | while IFS="," read year round winner opponent winner_goals opponent_goals
do
  if [[ $year != year ]]
  then
    team_id1=$($PSQL "select team_id from teams where name='$winner'")
    team_id2=$($PSQL "select team_id from teams where name='$opponent'")
    if [[ -z $team_id1 ]]
    then
      team1=$($PSQL "insert into teams(name) values('$winner')")
      echo inserted team $winner
    fi

    if [[ -z $team_id2 ]]
    then
      team2=$($PSQL "insert into teams(name) values('$opponent')")
      echo inserted team $opponent
    fi
  fi
done


cat games.csv | while IFS="," read year round winner opponent winner_goals opponent_goals
do
  if [[ $year != year ]]
  then
    wid=$($PSQL "select team_id from teams where name='$winner'")
    oid=$($PSQL "select team_id from teams where name='$opponent'")
    gameid=$($PSQL "select game_id from games where year=$year and round='$round' and winner_goals=$winner_goals and opponent_goals=$opponent_goals and winner_id=$wid and opponent_id=$oid")
    if [[ -z $gameid ]]
    then
      game=$($PSQL "insert into games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) values($year, '$round', $wid, $oid, $winner_goals, $opponent_goals)")
      echo inserted game $game
    fi
  fi
done

