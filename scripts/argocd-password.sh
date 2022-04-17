#!/bin/bash

ARGOCD_PASSWORD=$(kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d)

echo "argocd password: "$ARGOCD_PASSWORD