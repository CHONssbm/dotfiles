#!/usr/bin/env bash

#function Hello(){
# echo "Hello"
# echo "This is our function"
# echo "We can add as much as we want in here"
# echo "and to repeat everything that is in here"
# echo "we only need to call out fuction 'Hello'"
#

### This format saves us a few bytes, but it's less obvious that this is a function 
# Hello(){
# echo "Hello"
# echo "This is our function"
# echo "We can add as much as we want in here"
# echo "and to repeat everything that is in here"
# echo "we only need to call out fuction 'Hello'"
#}

#Hello

network_test(){
  if ping -c l https://archlinux.org &> /dev/null
  then
    echo "netowrk is up."
  else
    echo "network is down."
    if ping -c 1 8.8.8.8 &> /dev/null
    then
      echo "Ping to 1 8.8.8.8 works, we have a DNS failure."
    else
      echo "Ping to 1 8.8.8.8 also failed, the network has an issue."
      ifconfig >> nwinterface.txt
    fi
  fi
}
network_test
