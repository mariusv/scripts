#!/bin/bash

OWNER=$@
KONTA=`ls -1A /var/cpanel/users/`

count=1
for x in `echo -n "$KONTA"`;do
  wiersz=`grep -i ^dns /var/cpanel/users/"$x" |cut -d= -f2`
  DOMAIN[$count]=$wiersz
  count=$[$count+1]
  echo "Login:        `echo "$x"`"


    for i in `echo "${DOMAIN[@]}" | sed  's/ /\n/g'`;do
      for n in ` ls -A /home/"$x"/mail/"$i"/ 2>/dev/null`;do

           if   [ "$n" == "cur" ];then echo "$n" > /dev/null
           elif [ "$n" == "new" ];then echo "$n" > /dev/null
           elif [ "$n" == "tmp" ];then echo "$n" > /dev/null
           elif [ "$n" == "" ];then echo "$n" > /dev/null
           else
           echo  "$n"@"$i"
           fi
      done
    done
    echo;echo;
done
