npm install
npm run start-webdriver
chmod +x wait-for-it.sh && ./wait-for-it.sh -t 60 127.0.0.1:4444 -- echo "driver is up"
npm run test-local