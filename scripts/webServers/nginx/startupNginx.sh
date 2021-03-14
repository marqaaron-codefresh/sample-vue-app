#!/bin/bash

echo "--------- Nginx Server Startup Logs -----------"

echo "Exporting VERSION from file"
export VERSION=$(cat /env/version)
export WEB_SERVER=$(cat /env/web_server)

echo "Making /var/log/nginx directory"
mkdir -p /var/log/nginx

echo "Making /var/www/html directory"
mkdir -p /var/www/html

echo "Moving Nginx Config files"
mv /scripts/webServers/nginx/config/nginx.conf /etc/nginx/nginx.conf
mv /scripts/webServers/nginx/config/default.conf /etc/nginx/conf.d/default.conf

echo "Moving build files from /ui/src/dist to /var/www/html"
mv /ui/app/dist/* /var/www/html

echo "Overwriting env.js"
cat > /var/www/html/env.js << EOF
(function (window) {
  window.__env = window.__env || {};
  window.__env.VERSION = "${VERSION}" ? "${VERSION}" : "local" ;
  window.__env.WEB_SERVER = "${WEB_SERVER}" ? "${WEB_SERVER}" : "locally" ;
}(this));
EOF

echo "Making nginx user owner of /var/www/html directory"
chown nginx:nginx /var/www/html

echo "Bringing up Nginx web server"
echo "--------- Startup Complete -----------"

nginx -g 'daemon off;'