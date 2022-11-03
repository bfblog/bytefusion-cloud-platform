#!/bin/bash

set -x 
kubectl apply -f environments/docker-desktop/kubernetes/tekton-pipelines/ingress.yaml

kubectl apply -f third-party/tekton/v0.41.0/release.yaml
kubectl apply -f third-party/tekton-dashboard/v0.30.0/tekton-dashboard-release.yaml
kubectl apply -f third-party/tekton-triggers/v0.21.0/release.yaml

kubectl apply --namespace ingress-nginx -f third-party/ingress-nginx/v1.1.1/install.yaml
kubectl create namespace argocd
kubectl apply --namespace argocd -f third-party/argocd/v2.5.1/release.yaml

kubectl wait --namespace ingress-nginx --for=condition=ready pod --selector=app.kubernetes.io/component=controller --timeout=120s