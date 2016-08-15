#!/bin/bash

if [ -z "$DEFAULT_PASSWD" ]; then
    WARN=1
    DEFAULT_PASSWD=DhP5rYyBgz
fi

echo "   DEFAULT_USER=$DEFAULT_USER"
if [ -n "$WARN" ]; then
    echo -e "\n***** WARNING: USING DEFAULT PASSWORD ******\n"
    echo "Please change as soon as possible:"
    echo "   DEFAULT_PASSWD=$DEFAULT_PASSWD"
    echo -e "\n***** WARNING: USING DEFAULT PASSWORD ******\n"
fi

if [ ! -f /data/.htaccess ]; then
	htpasswd -c -b /data/.htaccess $DEFAULT_USER "$DEFAULT_PASSWD"
else
	htpasswd -b /data/.htaccess $DEFAULT_USER "$DEFAULT_PASSWD"
fi

echo "Password file looks like this: "
cat /data/.htaccess
