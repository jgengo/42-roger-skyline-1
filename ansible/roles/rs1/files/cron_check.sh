#!/bin/bash

if [ -f /tmp/crontab.bak ]
then
	old="$(md5sum /tmp/crontab.bak | cut -d ' ' -f 1)"
	current="$(md5sum /var/spool/cron/crontabs/root | cut -d ' ' -f 1)"

	if [ "$old" == "$current" ]
	then
		exit 0
	else
		echo "crontab has been modified !!!" | mail security
		cat /var/spool/cron/crontabs/root > /tmp/crontab.bak
	fi
else
	echo "no old file ... let's create one"
	cat /var/spool/cron/crontabs/root > /tmp/crontab.bak
fi
