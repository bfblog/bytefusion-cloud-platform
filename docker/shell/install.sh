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
