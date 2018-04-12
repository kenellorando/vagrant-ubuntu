#!/usr/bin/env bash
echo '----------------------------------------'
echo 'Cleaning apt-get...'
echo '----------------------------------------'
sudo apt-get clean
sudo apt-get install -f
echo '----------------------------------------'
echo 'Importing mongodb keys and list file...'
echo '----------------------------------------'
# Import keys and list file for mongodb
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2930ADAE8CAF5059EE73BB4B58712A2291FA4AD5
echo "deb [ arch=amd64 ] https://repo.mongodb.org/apt/ubuntu trusty/mongodb-org/3.6 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.6.list


echo '----------------------------------------'
echo 'Updating and upgrading the package database...'
echo '----------------------------------------'
# Update the package database
sudo apt-get autoclean $$ apt-get clear cache
sudo apt-get -y update
sudo apt-get -y upgrade


echo '----------------------------------------'
echo 'Installing git, nodejs (& npm), and mongoDB...'
echo '----------------------------------------'
# Install software
sudo apt-get -f -y install git
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
sudo apt-get -f -y install nodejs
sudo apt-get -f -y install mongodb-org


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
sudo service mongod start


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