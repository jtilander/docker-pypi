#!/bin/bash
#set -exv
exec 1> >(logger -s -t $(basename $0)) 2>&1

if [ $AUTO_UPDATE -ne 1 ]; then
	exit 0
fi

set -e
(
	flock -n 200
	
	echo "Updating the packages from the master registry..."

	time pypi-server -Ux /data

) 200>/tmp/.pypi-update.lock
