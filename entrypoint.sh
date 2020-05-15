#!/bin/bash

# Export values to use with TakeShape's cli
export TS_PROJECT_ID=$1
export TS_AUTH_TOKEN=$2
export TS_SITE_NAME=$3
export TS_SITE_ID=$4

# Install dependencies
npm install

# Deploy with TakeShape
npm run deploy
