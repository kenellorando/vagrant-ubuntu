#!/usr/bin/env bash
echo '----------------------------------------'
echo 'Cleaning apt-get...'
echo '----------------------------------------'
apt-get clean

echo '----------------------------------------'
echo 'Importing mongodb keys and list file...'
echo '----------------------------------------'
# Import keys and list file for mongodb
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2930ADAE8CAF5059EE73BB4B58712A2291FA4AD5
echo "deb [ arch=amd64 ] https://repo.mongodb.org/apt/ubuntu trusty/mongodb-org/3.6 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.6.list


echo '----------------------------------------'
echo 'Installing nodejs'
echo '----------------------------------------'
# Install nodejs
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
sudo apt-get install -y nodejs

echo '----------------------------------------'
echo 'Updating and upgrading the package database...'
echo '----------------------------------------'
# Update the package database
apt-get -y update
apt-get -y upgrade


echo '----------------------------------------'
echo 'Installing git, npm, and mongoDB...'
echo '----------------------------------------'
# Install software
apt-get -f -y install git npm mongodb-org


echo '----------------------------------------'
echo 'Autoremoving unnecessary software...'
echo '----------------------------------------'
# Autoremove unnecessary software
apt-get -y autoremove

echo '----------------------------------------'
echo 'Creating a database directory...'
echo '----------------------------------------'
# Create database directory
sudo mkdir /data


echo '----------------------------------------'
echo 'Stopping existing mongod processes...'
echo '----------------------------------------'
sudo service mongod stop

echo '----------------------------------------'
echo 'Starting mongo with database path "/data"... (will release control)'
echo '----------------------------------------'
# Start mongod daemon
sudo mongod --dbpath /data &

#echo '----------------------------------------'
#echo 'Restarting the mongod service...'
#echo '----------------------------------------'
#sudo service mongod restart

echo '----------------------------------------'
echo 'Changing directory to /tuto'
echo '----------------------------------------'
cd /tuto


echo '----------------------------------------'
echo 'Installing node package dependencies...'
echo '----------------------------------------'
npm install


echo '----------------------------------------'
echo 'Starting node server... (will release control)'
echo '----------------------------------------'
nodejs server.js &


echo '----------------------------------------'
echo 'Provisioner completed execution!'
echo '----------------------------------------'