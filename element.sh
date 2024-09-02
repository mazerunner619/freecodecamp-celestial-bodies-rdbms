PSQL="psql -X --username=freecodecamp --dbname=periodic_table --no-align --tuples-only -c"
if [[ $1 ]]
then
  if [[ $1 =~ ^([0-9]+)$ ]]
  then
    elem="$($PSQL "select * from elements where atomic_number=$1")"
    atomic_number=$1
  else
    elem="$($PSQL "select * from elements where name='$1' or symbol='$1'")"
    atomic_number=$(echo $elem | sed -E 's/\|.*//')
  fi
  if [[ $elem ]]
  then
    name=$(echo $elem | sed -E 's/[0-9].*\|//')
    symbol=$(echo $elem | sed -E 's/[0-9]+\|//' | sed -E 's/\|.*//')
    props=$($PSQL "select * from properties left join types using(type_id) where atomic_number=$atomic_number")
    IFS="|" read -r type_id atomic_no atomic_mass melting_point_celsius boiling_point_celsius type <<< $props
    echo "The element with atomic number $atomic_no is $name ($symbol). It's a $type, with a mass of $atomic_mass amu. $name has a melting point of $melting_point_celsius celsius and a boiling point of $boiling_point_celsius celsius."
  else
   echo "I could not find that element in the database."
  fi
  else
    echo "Please provide an element as an argument."
fi
