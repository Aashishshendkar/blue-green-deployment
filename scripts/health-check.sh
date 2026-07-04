#!/bin/bash

URL=$1

if curl -s --head $URL | grep "200" > /dev/null; then
  echo "HEALTHY"
  exit 0
else
  echo "UNHEALTHY"
  exit 1
fi