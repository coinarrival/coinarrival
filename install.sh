#!/bin/bash
set -e # once broken, exit bash

echo "Building Repo"
# Build FrontEnd
cd FrontEnd
echo "Building FrontEnd Page..."
npm install
npm run build

cp index.html ../ServerEnd/resources/public/index.html
cp -r ./dist/ ../ServerEnd/resources/
cp -r ./static/ ../ServerEnd/resources/public/static
mv ../ServerEnd/resources/dist/*.js ../ServerEnd/resources/public/dist/*.js

echo "Build Finish"

# Build BackEnd
cd ../BackEnd
echo "Building BackEnd..."

docker-compose build

echo "Build Finish"

# Build ServerEnd
cd ../ServerEnd
echo "Building ServerEnd..."

docker-compose up

echo "Build Finish"

echo "coinarrival is running at http://localhost:3000/public/index.html"
read -p "Press any key to continue." var