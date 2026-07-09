#!/bin/bash

#URL=$1
URL=http://1.1.1.1

STATUS=$(curl -o /dev/null -s -w "%{http_code}" $URL)

if [ "$STATUS" = "200" ]; then
    echo "Application Healthy"
    exit 0
else
    echo "Application Unhealthy"
    exit 1
fi