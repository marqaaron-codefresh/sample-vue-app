#!/bin/bash

echo "--------- Image Step 2 Logs -----------"

if [ "$BUILD_TYPE" = 'test' ]; then
  echo "This is a Test Build. Packages Already Installed"
else
  echo "Installing required packages for Production Build"
  apk add --no-cache git nodejs npm
fi

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

if [ "$BUILD_TYPE" = 'test' ]; then
  echo "This is a Test Build. Leaving node_modules for testing purposes."
else
  echo "Removing existing ./node_modules directory if it exists"
  rm -rf node_modules
fi