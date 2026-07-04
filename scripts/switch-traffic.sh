#!/bin/bash

ALB_ARN="BlueGreen-ALB"
BLUE_TG="Blue-TG"
GREEN_TG="Green-TG"

NEW_TG=$1

aws elbv2 modify-listener \
  --listener-arn $ALB_ARN \
  --default-actions Type=forward,TargetGroupArn=$NEW_TG

echo "Traffic switched to $NEW_TG"