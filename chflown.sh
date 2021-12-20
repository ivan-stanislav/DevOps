#!/bin/bash

curusrid=`id | grep uid=0`
user=$1
directory=$2

if [ -n "$curusrid" ];
  then 
   echo -e  "\e[32mYou are the root and allowed to run $0 script\e[0m"
  else
   echo -e "\e[31mYou are not the root and have not permission to run $0 script\e[0m"
   exit
fi

if [ -z "$1" ];
 then  echo -e "\e[31mUser must be set\e[0m"
 exit
  elif [ -z "$2" ];
   then  echo -e "\e[31mDirectory must be set\e[0m"
   exit
else



 usr=`cat /etc/passwd | grep "$1"`
 echo $usr
# if [ -n "$usr" ];
#     then echo -e "\e[32mUser $user have been found\e[0m"
#        if [ -n "$dir" ];
#          then dir=`ls-l | grep'
#          else echo -e "\e[31mDirectory must be set\e[0m
#        fi
#     else echo -e "\e[31mDirectory not found\e[0m"
#     else echo -e "\e[31mUser $user not found\e[0m"
#    exit

sudo chown -R $1 $2

fi