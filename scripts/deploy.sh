#!/bin/bash

set -e

KEY="/home/ec2-user/BLUEGREEN-KEY.pem"

BLUE_IP="13.51.206.11"
GREEN_IP="16.170.211.157"

echo "=================================="
echo "Deploying Version 2 to GREEN Server"
echo "=================================="

ssh -i $KEY -o StrictHostKeyChecking=no ec2-user@$GREEN_IP "mkdir -p /tmp/app"

scp -i $KEY -o StrictHostKeyChecking=no -r version2/* ec2-user@$GREEN_IP:/tmp/app/

ssh -i $KEY -o StrictHostKeyChecking=no ec2-user@$GREEN_IP << EOF

sudo rm -rf /var/www/html/*
sudo cp -r /tmp/app/* /var/www/html/
sudo chown -R apache:apache /var/www/html
sudo systemctl restart httpd

EOF

echo "=================================="
echo "Deployment Completed Successfully"
echo "=================================="