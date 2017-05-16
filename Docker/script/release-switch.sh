#!/bin/bash
COUNTER=0

while [ 1 ]
do
	if [ $((COUNTER%2)) -eq 0 ];
	then
	    echo "$(date +"%F %T") [1] Switch to release 1"
	    ln -nsf /var/www/html/release1 /var/www/current
	else
	    echo "$(date +"%F %T") [2] Switch to release 2"
	    ln -nsf /var/www/html/release2 /var/www/current
	fi
    let COUNTER=COUNTER+1 
    sleep 10
done
