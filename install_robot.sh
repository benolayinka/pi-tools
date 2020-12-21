#!/bin/sh

read -p 'did you create .env?: ' confirm

if ($confirm "!=" y && $confirm != "Y"); then
  exit 1
fi

# sudo cp config.txt /boot/config.txt

sudo apt-get update -y
sudo apt-get upgrade -y
sudo rpi-update -y

sudo apt install git -y
cd ..
git clone https://github.com/benolayinka/rover-client.git
cd rover-client

sudo apt install nodejs npm -y
npm install
xargs sudo apt -y install < dependencies

sudo npm install pm2 -g
pm2 start gstreamer.sh
pm2 start johnny.js
pm2 save
pm2 startup
