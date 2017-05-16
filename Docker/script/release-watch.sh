#!/bin/bash
CURRENT=/var/www/current
RED=`tput setaf 1`
GREEN=`tput setaf 2`
RESET=`tput sgr0`

while [ 1 ]
do	
	if [ "$(readlink -- "$CURRENT")" = /var/www/html/release1 ];
	then
		if [ $(curl -s localhost) = "release1" ];
		then
			echo "$(date +"%F %T") ${GREEN}[1][OK] Current path release is 1 and response matches${RESET}"
		else
			echo "$(date +"%F %T") ${RED}[1][KO] Current path release is 1 and response doesn't match${RESET}"
		fi
	else
		if [ $(curl -s localhost) = "release2" ];
		then
			echo "$(date +"%F %T") ${GREEN}[2][OK] Current path release is 2 and response matches${RESET}"
		else
			echo "$(date +"%F %T") ${RED}[2][KO] Current path release is 2 and response doesn't match${RESET}"
		fi
	fi
    sleep 1
done
