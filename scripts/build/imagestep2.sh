#!/bin/bash

echo "--------- Image Step 2 Logs -----------"

echo "Installing required packages"
apk add --no-cache git nodejs npm

echo "Moving into /ui/app directory"
cd /ui/app

echo "Removing existing ./node_modules directory if it exists"
rm -rf node_modules

echo "Installing npm modules"
npm ci

echo "Removing existing ./dist directory if it exists"
rm -rf dist

echo "Building Production App"
npm run build