#!/usr/bin/env bash

# import names
. ./build/release.cfg
artifact_name="gcr.io/$projectid/$servicename"
artifact_tag="$artifact_name:$servicemajor.$serviceminor.$BUILD_NUMBER"

# Build
docker build -t $artifact_name .
docker tag $artifact_name $artifact_tag

# Push to Google Cloud Engine
gcloud docker push $artifact_name
gcloud docker push $artifact_tag
