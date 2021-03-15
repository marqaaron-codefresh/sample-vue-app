#!/bin/bash

echo "--------- Startup Logs -----------"

echo "Exporting WEB_SERVER from file"
export WEB_SERVER=$(cat /env/web_server)

echo "Changing /scripts/webServers/nginx/startupNginx.sh file to executable"
chmod +x /scripts/webServers/nginx/startupNginx.sh

if [ "$WEB_SERVER" = 'nginx' ]; then
  echo "Nginx Server selected for Build"
  echo "Initiating startupNginx.sh"
  /bin/bash -c /scripts/webServers/nginx/startupNginx.sh
else
  echo "Unknown WEB_SERVER selected. No Server Started. No further actions."
fi