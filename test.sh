#!/bin/bash


echo -e "\033[41;33m
################################################
#      1:search a record                       #
#      2:add a record                          #
#      3:delete a record                       #
#      4:display all record                    #
#      5:edit record with vi                   #
#      H:help screen                           #
#      Q:exit pragma                           #
################################################\033[0m"
while :
do
echo -e "\033[40;32m"
read -p "please enter your choice[1 2 3 4 5 H Q]:" num
echo -e "\033[0m"
case $num in
 1)
  echo -e "\033[40;37m"
     read -p "please enter name >>>" name
  echo -e "\033[0m"
         while [ -z $name ]
         do
         echo "you didn't enter a name"
      echo -e "\033[40;37m"
         read -p "please enter name >>>" name
      echo -e "\033[0m"
         done 
      
         if [ ! -f record ];then
           echo "you must have some scores before you can search!"
           exit
         else
           grep "$name" record &>/dev/null   
           if [ $? -ne 0 ];then
             echo "name not in record" 
             sleep 1 
             continue
           else
             grep "$name" record | awk -F. '{print $2,$3}'
             sleep 3 && continue
           fi
         fi ;;
 2)
 echo -e "\033[40;32m" 
 read -p "enter name and score of a recoed:" abc
 echo -e "\033[0m"
 while [ -z $abc ]
    do
   echo "you didn't enter any value"
   echo -e "\033[40;32m" 
   read -p "please enter name and score:" abc
   echo -e "\033[0m"
    done
  echo $abc >> record
  echo "added $abc in record"
  sleep 3
  exit ;;
#elif [ $num = 3 ];then
 # sed -i '$d' record
 4)
 cat record
 sleep 3
 continue ;;
 5)
 vim record 
  continue ;;
"H")
  echo -e "\033[40;36m This is a student's record manager program\033[0m"
  sleep 3
  continue ;;
"Q")
  exit ;;
 *)
 echo "please enter valid mode "
  continue ;;
esac
done
  


