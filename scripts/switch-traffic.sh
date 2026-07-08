#!/bin/bash

set -e

LISTENER_ARN="arn:aws:elasticloadbalancing:eu-north-1:752988090634:listener/app/BlueGreen-ALB/566b7bfc898be69a/78b105d999c9cbdb"

GREEN_TG="arn:aws:elasticloadbalancing:eu-north-1:752988090634:targetgroup/Green-TG/d322753230d15c78"

echo "========================================"
echo "Switching ALB Traffic To Green"
echo "========================================"

aws elbv2 modify-listener \
--listener-arn $LISTENER_ARN \
--default-actions Type=forward,TargetGroupArn=$GREEN_TG

echo "========================================"
echo "Traffic Successfully Switched"
echo "========================================"