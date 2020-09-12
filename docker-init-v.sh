#!/bin/bash

clear

# Check if user is root
if [ $(id -u) != "0" ]; then
  echo "Error: You must be root to run this script."
  exit 1
fi

# Header prompt
echo "================================================================================"
echo "> remove /opt/lampp"
rm -rf /opt/lampp

echo "> mkdir /opt/lampp/etc & /opt/lampp/var"
mkdir /opt/lampp
mkdir /opt/lampp/etc
mkdir /opt/lampp/var


echo "> create tmp docker"
docker create -i -t --rm --name tmp ydj317/xampp-7.4.9:origin

echo "> copy data from tmp docker"
docker cp tmp:/opt/lampp/etc /opt/lampp
docker cp tmp:/opt/lampp/var /opt/lampp

echo "> stop and rm tmp docker"
docker stop tmp
docker rm tmp

