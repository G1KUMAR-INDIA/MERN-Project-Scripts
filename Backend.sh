mkdir server
cd server
echo "Server">server.js
npm init -y
npm i nodemon express dotenv cors mongoose body-parser multer
cat > package.json <<EOL
{
  "name": "server",
  "version": "1.0.0",
  "main": "server.js",
  "scripts": {
    "test": "echo \"Error: no test specified\" && exit 1",
    "start": "node server.js",
    "dev": "nodemon server.js"
  },
  "keywords": [],
  "author": "",
  "license": "ISC",
  "description": "",
  "dependencies": {
    "body-parser": "^1.20.3",
    "cors": "^2.8.5",
    "dotenv": "^16.4.7",
    "express": "^4.21.2",
    "mongoose": "^8.9.0",
    "multer": "^1.4.5-lts.1",
    "nodemon": "^3.1.9"
  }
}
EOL