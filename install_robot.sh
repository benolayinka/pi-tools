#!/bin/sh

cp ./config.txt /boot/config.txt

sudo apt-get update -y
sudo apt-get upgrade -y
sudo rpi-update -y

sudo apt install git -y
cd ..
git clone https://github.com/benolayinka/rover-client.git
cd rover-client

sudo apt install nodejs -y
xargs sudo apt -y install < dependencies
npm install
