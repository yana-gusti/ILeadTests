#!/usr/bin/env bash
#   Use this script to run tests
pkill -f chrome
npm i
npm run start-webdriver &
# Wait for port 4444 to be listening connections
chmod +x wait-for-it.sh && ./wait-for-it.sh -t 60 127.0.0.1:4444 -- echo "driver is up"
npm run test-local
