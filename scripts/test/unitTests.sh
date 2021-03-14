#!/bin/bash

echo "--------- Unit Tests Logs -----------"

echo "Moving to App Source File Directory /ui/app"
cd /ui/app

echo "Running Unit Tests for App"
npm run test:unit