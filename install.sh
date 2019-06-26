#!/bin/bash
set -e # once broken, exit bash

echo "Building Repo"

# Build FrontEnd
echo "Building FrontEnd Page..."

cd ../coinarrival_v1.0/FrontEnd
npm install
npm run build

cp index.html ../coinarrival_v1.0/ServerEnd/resources/public/index.html
cp -r ./dist/ ../coinarrival_v1.0/ServerEnd/resources/
cp -r ./static/ ../coinarrival_v1.0/ServerEnd/resources/public/static
mv ../coinarrival_v1.0/ServerEnd/resources/dist/*.js ../coinarrival_v1.0/ServerEnd/resources/public/dist/*.js

echo "Build Finish"

# Build BackEnd
echo "Building BackEnd..."

cd ../coinarrival_v1.0/BackEnd
docker-compose build

echo "Build Finish"

# Build ServerEnd
echo "Building ServerEnd..."

cd ../coinarrival_v1.0/ServerEnd
docker-compose up

echo "Build Finish"

echo "coinarrival is running at http://localhost:3000/public/index.html"
read -p "Press any key to continue." var