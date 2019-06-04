#! /bin/bash

echo "Welcome to our Camunda!"

while true; do
  echo
  echo "What would you like to do?"
  echo 
  echo "1. Start Camunda Modeler"
  echo "2. Start Camunda Engine"
  echo "3. End Camunda Engine"
  echo "4. Exit This Program"
  echo
  echo -n "Type the number you want and push enter: "
  read num

  if   (("1" == "$num")); then
    echo "Starting Camunda Modeler"
    xterm -e 'cd camunda-modeler && ./camunda-modeler' &
  elif (("2" == "$num")); then
    echo "Starting Camunda Engine"
    xterm -e 'cd camunda-engine && ./start-camunda.sh && sleep 10' &
  elif (("3" == "$num")); then
    echo "Killing Camunda Engine"
    xterm -e 'cd camunda-engine && ./shutdown-camunda.sh' &
  elif (("4" == "$num")); then
    echo "Exiting"
    break
  else
    echo "$num wasn't recognized as a command"
  fi
done

