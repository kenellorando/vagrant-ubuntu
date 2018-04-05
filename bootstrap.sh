#!/usr/bin/env bash
apt-get clean
apt-get -y update
apt-get -y upgrade
apt-get -f -y install git nodejs postgresql postgresql-contrib
apt-get -y autoremove
cd /
echo 'Run "git clone https://github.com/illinoistech-itm/2018-itmt-7'
