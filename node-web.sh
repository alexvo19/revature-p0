#!/bin/bash
# automate the process of starting, stopping a node web application

#function for start
start()
{
  #read package.json for start script 
  start=$(cat package.json | grep "start")
  

  #conditional to stop if no start script
  if [ -z "$start" ]
   then
    echo "no start script"
    exit 1
  fi

  #runs if no error
  echo "starting project"
  npm start
}



#function for stop
stop()
{
  #read package.json for stop script
  stop=$(cat package.json | grep "stop")
  

  #conditional for stop script
  if [ -z "$stop" ]
   then
    echo "no stop script"
    exit 1
  fi

  #runs stop script
  echo "stopping project"
  npm stop

}

#arguments 
command=$1
directory=$2

#check for node
if [ -z $(which node) ]
 then
  echo "no node"
  exit 1
fi

#change to desired directory
cd $directory

#check dir for package.json
if ! [ -e package.json ]
 then
  echo "no package.json"
  exit 1
fi

#case to run appropriate function
case "$command" in
  "start") start
  ;;
  "stop") stop
  ;;
esac