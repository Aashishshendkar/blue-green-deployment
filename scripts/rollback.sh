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

echo "========================================"
echo "Switching ALB Traffic Back To BLUE"
echo "========================================"

aws elbv2 modify-listener \
--listener-arn arn:aws:elasticloadbalancing:eu-north-1:752988090634:listener/app/BlueGreen-ALB/566b7bfc898be69a/78b105d999c9cbdb \
--default-actions Type=forward,TargetGroupArn=arn:aws:elasticloadbalancing:eu-north-1:752988090634:targetgroup/Blue-TG/806d77cd752a1c24

echo "========================================"
echo "Traffic Switched Back To BLUE"
echo "========================================" 