#!/bin/bash

clear

# Check if user is root
if [ $(id -u) != "0" ]; then
  echo "Error: You must be root to run this script."
  exit 1
fi

# Header prompt
echo "================================================================================"
echo "xampp download"
echo "================================================================================"

curl -o /tmp/xampp-installer.run https://jaist.dl.sourceforge.net/project/xampp/XAMPP%20Linux/7.4.9/xampp-linux-x64-7.4.9-0-installer.run
chmod +x /tmp/xampp-installer.run

echo "================================================================================"
echo "xampp install"
echo "================================================================================"

docker run -i -t -d --rm --name lampp centos:7
docker cp /tmp/xampp-installer.run lampp:/tmp/xampp-installer.run
docker exec -it lampp yum update
docker exec -it lampp yum install -y net-tools
docker exec -it lampp /tmp/xampp-installer.run
docker exec -it lampp /opt/lampp/lampp stop

echo "================================================================================"
echo "xampp create tar.gz"
echo "================================================================================"

docker exec -it lampp tar -zcvf xampp.tar.gz /opt/lampp
docker cp lampp:/xampp.tar.gz ./xampp.tar.gz

echo "ok"

exit 0




