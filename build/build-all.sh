#!/bin/bash

actual_path=$(readlink -f "${BASH_SOURCE[0]}")
script_dir=$(dirname "$actual_path")

tkn pipeline start \
   --namespace tekton-pipelines \
   bytefusion-data-platform \
   --workspace name=source,volumeClaimTemplateFile=$script_dir/workspace-template.yaml