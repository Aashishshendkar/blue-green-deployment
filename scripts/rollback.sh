#!/bin/bash

set -e

KEY="/var/lib/jenkins/BLUEGREEN-KEY.pem"

BLUE_IP="13.51.206.11"

echo "Rolling Back Application..."

ssh -i $KEY -o StrictHostKeyChecking=no ec2-user@$BLUE_IP "mkdir -p /tmp/app"

scp -i $KEY -o StrictHostKeyChecking=no -r version1/* ec2-user@$BLUE_IP:/tmp/app/

ssh -i $KEY -o StrictHostKeyChecking=no ec2-user@$BLUE_IP << EOF

sudo rm -rf /var/www/html/*
sudo cp -r /tmp/app/* /var/www/html/
sudo chown -R apache:apache /var/www/html
sudo systemctl restart httpd

EOF

echo "Rollback Completed Successfully"