#!/bin/bash

echo "--------- Apache Server Startup Logs -----------"

echo "Enabling Apache2 Rewrite Module"
a2enmod rewrite

echo "Moving App files into /var/www/html."
echo "WARNING: You may see errors if running locally with ./src directory bound to /var/www/html. This is expected."
mv -u /src/* /var/www/html

echo "Changing /var/www/html ownership to www-data"
chown -R www-data /var/www/html

echo "Moving Apache ports.conf file to /etc/apache2 directory"
cp /scripts/webServers/apache/configs/ports.conf /etc/apache2/ports.conf
echo "Moving Apache 000-default.conf file to /etc/apache2/sites-available directory"
cp /scripts/webServers/apache/configs/000-default.conf /etc/apache2/sites-available

echo "Initiating modifications to the Apache web server config."
if [ -z "$SERVER_NAME" ];
then
  echo "No SERVER_NAME provided. Modifying Apache config to host from localhost"
  sed -i "s|replaceServerName|localhost|g" /etc/apache2/sites-available/000-default.conf
else
  echo "SERVER_NAME set as $SERVER_NAME. Modifying Apache config to host from $SERVER_NAME"
  sed -i "s|replaceServerName|$SERVER_NAME|g" /etc/apache2/sites-available/000-default.conf
fi

echo "Starting Worker Process using startWorker.sh script."
bash /scripts/workers/startWorker.sh &

echo "Bringing up Apache web server"
/usr/sbin/apache2ctl -DFOREGROUND