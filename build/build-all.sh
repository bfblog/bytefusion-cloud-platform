#!/bin/bash

tkn pipeline start \
   --namespace tekton-pipelines \
   bytefusion-data-platform \
   --workspace name=source,volumeClaimTemplateFile=./workspace-template.yaml