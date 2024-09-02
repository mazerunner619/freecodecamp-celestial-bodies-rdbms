#! /bin/bash

echo -e "\n~~~~~ MY SALON ~~~~~\n"
echo -e "Welcome to My Salon, how can I help you?\n"

PSQL="psql -X --username=freecodecamp --dbname=salon --no-align --tuples-only -c"
services=$($PSQL "select service_id, name from services")

MAIN_MENU(){
  if [[ $1 ]]
  then
    echo $1
  fi
  echo "$services" | while IFS="|" read sid name
  do
    echo "$sid) $name"
  done
  len=$(echo "$services" | wc -l)
  read SERVICE_ID_SELECTED
  if [[ ! $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]
  then
    # invalid option chosen
    MAIN_MENU "I could not find that service. What would you like today?"
  else
    # a valid option chosen
    serviceChosen=$($PSQL "select name from services where service_id=$SERVICE_ID_SELECTED")
    
    if [[ -z $serviceChosen ]]
    then
      MAIN_MENU "I could not find that service. What would you like today?"
    fi

    echo -e "\nWhat's your phone number?"
    read CUSTOMER_PHONE
    # check if customer already in DB
    customer=$($PSQL "select name, customer_id from customers where phone='$CUSTOMER_PHONE'")
    if [[ -z $customer ]]
    then
      echo -e "\nI don't have a record for that phone number, what's your name?"
      read CUSTOMER_NAME
      # add this new customer to DB
      add_customer=$($PSQL "insert into customers(phone, name) values('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
      id=$($PSQL "select customer_id from customers where phone='$CUSTOMER_PHONE'")
    else
      CUSTOMER_NAME=$(echo $customer | sed -E 's/\|[0-9]+//')
      id=$(echo $customer | sed -E 's/.*\|//')
    fi
    echo -e "\nWhat time would you like your $serviceChosen, $CUSTOMER_NAME?"
    read SERVICE_TIME
    app=$($PSQL "insert into appointments(customer_id, service_id, time) values($id, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")
    echo "I have put you down for a $serviceChosen at $SERVICE_TIME, $CUSTOMER_NAME."
  fi
}

MAIN_MENU
