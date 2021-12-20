#!/bin/bash
curusrid=`id | grep uid=0`
if [ -z "`id | grep uid=0`" ];
  then 
      echo -e "\e[31mYou are not the root and have no permission to run $0 script\e[0m"
      exit
  else
      echo -e  "\e[32mYou are the root and allowed to run $0 script\e[0m"
      if [ -z "$1" ];
        then
            echo -e "\e[31mUser must be set\e[0m"
            exit
         elif [ -z "$2" ];
             then
                 echo -e "\e[31mDirectory must be set\e[0m"
                 exit
         else
             if [ -n "`cat /etc/passwd | grep -w $1`" ]; 
               then
                   echo -e  "\e[32mUser $1 has been found\e[0m"
                   dir=`ls -l | grep -w $2`
                   if [ -n "$dir" ];
                     then
                        echo -e "\e[32mDirectory $2 has been found\e[0m"
                        sudo chown -R $1 $2
                        echo -e "\e[32m$2 directory owner sucsesfully changed to $1\e[0m"
                     else
                        echo -e "\e[31mDirectory not found\e[0m"
                        exit
                   fi
               else
                 echo -e "\e[31mUser have $1 been not found\e[0m"
             fi
      fi
fi