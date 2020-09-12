#!/bin/bash

clear

echo "Start Lampp Docker Run"
docker run -i -t --name lampp -p 80:80 -p 443:443 -p 3306:3306 -d ydj317/xampp-7.4.9:version-1.0.1
echo "OK"