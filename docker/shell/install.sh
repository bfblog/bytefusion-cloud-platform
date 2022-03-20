#!/usr/bin/sh
echo "updating packages ..."
apt install -y gnupg curl

echo "installing keptn CLI ..."
curl -sL https://get.keptn.sh | bash

echo "installing tektioncd CLI ..."
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 3EFE0E0A2F2F60AA
echo "deb http://ppa.launchpad.net/tektoncd/cli/ubuntu eoan main"| tee /etc/apt/sources.list.d/tektoncd-ubuntu-cli.list
apt update
apt install -y tektoncd-cli

echo "installing argocd ..."
VERSION=v2.3.1 # Select desired TAG from https://github.com/argoproj/argo-cd/releases
curl -sSL -o /usr/local/bin/argocd https://github.com/argoproj/argo-cd/releases/download/$VERSION/argocd-linux-amd64
chmod +x /usr/local/bin/argocd

apt-get update && apt-get install -y apt-transport-https
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | tee -a /etc/apt/sources.list.d/kubernetes.list
apt-get update
apt-get install -y kubectl
