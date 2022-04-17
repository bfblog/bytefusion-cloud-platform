#!/bin/bash

BRANCH=$(git branch --show-current)

tkn pipeline start bf-data-plf \
  --namespace tekton-pipelines \
  --prefix-name $BRANCH \
  --workspace name=source,claimName=bytefusion-cloud-platform-workspace \
  --showlog