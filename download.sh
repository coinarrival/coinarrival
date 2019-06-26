# set up source code directory
cd ..
mkdir coinarrival_v1.0

echo "Downloading Source Code..."
cd coinarrival_v1.0
# FrontEnd code
git clone https://github.com/coinarrival/FrontEnd.git

# ServerEnd code
git clone https://github.com/coinarrival/ServerEnd.git

# BackEnd code
git clone https://github.com/coinarrival/BackEnd.git

mkdir ./ServerEnd/resources/public/dist
mkdir ./ServerEnd/resources/dist

echo "Download Finish."
