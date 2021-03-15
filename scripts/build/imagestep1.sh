#!/bin/bash

echo "--------- Image Step 1 Logs -----------"

if [ "$WEB_SERVER" = 'nginx' ]; then
  echo "Installing required nginx packages"
  apk add --no-cache nginx
else
  echo "Unknown WEB_SERVER selected. No Server Started. No further actions."
fi

echo "Installing required packages"
apk add --no-cache git nodejs npm

echo "Moving to root directory"
cd /

echo "Changing /scripts/build/imagestep2.sh file to executable"
chmod +x /scripts/build/imagestep2.sh

echo "Changing /scripts/startup.sh file to executable"
chmod +x /scripts/startup.sh

echo "Creating /env directory and moving to it"
mkdir env && cd /env

echo "Saving VERSION environment variable to text file for later"
echo ${VERSION} > version && chmod +rw version

echo "Saving APP_SERVER environment variable to text file for later"
echo ${WEB_SERVER} > web_server && chmod +rw version