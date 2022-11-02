#!/bin/bash

SCRIPT_DIR=$(realpath "$(dirname "$0")")
ROOT_DIR=$(realpath -e -- $SCRIPT_DIR/..)

TEKTON_VERSION=v0.41.0
TEKTON_DASHBOARD_VERSION=v0.30.0
TEKTON_TRIGGERS_VERSION=v0.21.0
NGINX_VERSION=v1.1.1
ARGOCD_VERSION=v2.5.1

echo "script dir is " $SCRIPT_DIR
echo "git root directory is " $ROOT_DIR
set -x 
mkdir --parents $ROOT_DIR/third-party/tekton/$TEKTON_VERSION
curl -L https://storage.googleapis.com/tekton-releases/pipeline/previous/$TEKTON_VERSION/release.yaml --output $ROOT_DIR/third-party/tekton/$TEKTON_VERSION/release.yaml

mkdir $ROOT_DIR/third-party/tekton-dashboard/$TEKTON_DASHBOARD_VERSION
curl -L https://github.com/tektoncd/dashboard/releases/download/$TEKTON_DASHBOARD_VERSION/tekton-dashboard-release.yaml --output $ROOT_DIR/third-party/tekton-dashboard/$TEKTON_DASHBOARD_VERSION/tekton-dashboard-release.yaml

mkdir $ROOT_DIR/third-party/tekton-triggers/$TEKTON_TRIGGERS_VERSION
curl -L https://storage.googleapis.com/tekton-releases/triggers/previous/$TEKTON_TRIGGERS_VERSION/release.yaml --output $ROOT_DIR/third-party/tekton-triggers/$TEKTON_TRIGGERS_VERSION/release.yaml

mkdir $ROOT_DIR/third-party/ingress-nginx/$NGINX_VERSION
curl -L https://raw.githubusercontent.com/bfblog/bytefusion-cloud-platform/main/third-party/ingress-nginx/$NGINX_VERSION/install.yaml --output $ROOT_DIR/third-party/ingress-nginx/$NGINX_VESRION/install.yaml

mkdir $ROOT_DIR/third-party/argocd/$ARGOCD_VERSION 
curl -L https://raw.githubusercontent.com/argoproj/argo-cd/$ARGOCD_VERSION/manifests/install.yaml --output $ROOT_DIR/third-party/argocd/$ARGOCD_VERSION/release.yaml