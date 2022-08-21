#!/bin/sh

echo "You are here, '`pwd`'".
gcloud run deploy ireco --region asia-northeast2 --source ./app
