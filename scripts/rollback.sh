#!/bin/bash

echo "Rollback started..."

KEY="/home/ec2-user/BLUEGREEN-KEY.pem"

BLUE_IP="13.60.183.232"
GREEN_IP="16.192.62.222"

ACTIVE_FILE="/tmp/active_env"

ACTIVE_ENV=$(cat $ACTIVE_FILE)

if [ "$ACTIVE_ENV" == "blue" ]; then
  TARGET_IP=$GREEN_IP
  NEW_ENV="green"
else
  TARGET_IP=$BLUE_IP
  NEW_ENV="blue"
fi

scp -i $KEY -o StrictHostKeyChecking=no -r version1/* ec2-user@$TARGET_IP:/tmp/app/

ssh -i $KEY ec2-user@$TARGET_IP << 'EOF'
sudo cp -r /tmp/app/* /var/www/html/
sudo systemctl restart httpd
EOF

echo $NEW_ENV > $ACTIVE_FILE

echo "Rollback completed"