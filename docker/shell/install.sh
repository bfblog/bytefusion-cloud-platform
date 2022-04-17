#!/usr/bin/sh
echo "updating packages ..."
export DEBIAN_FRONTEND=noninteractive

apt install -y gnupg curl maven bash-completion jq


echo "installing yq ..."
curl -o /tmp/yq_linux_amd64.tar.gz -LO https://github.com/mikefarah/yq/releases/download/v4.24.5/yq_linux_amd64.tar.gz 
tar xzvf /tmp/yq_linux_amd64.tar.gz  -C /usr/bin ./yq_linux_amd64
mv /usr/bin/yq_linux_amd64 /usr/bin/yq
chown 0 /usr/bin/yq
chgrp 0 /usr/bin/yq
chmod +x /usr/bin/yq
rm /tmp/yq_linux_amd64.tar.gz

echo "installing kubectl-slice ..."
curl --output kubectl-slice.tar.gz -LO https://github.com/patrickdappollonio/kubectl-slice/releases/download/v1.2.1/kubectl-slice_1.2.1_linux_x86_64.tar.gz 
tar xvzf kubectl-slice.tar.gz -C /usr/local/bin/ kubectl-slice
rm kubectl-slice.tar.gz

echo "installing keptn CLI ..."
curl -sL https://get.keptn.sh | bash

echo "installing tektioncd CLI ..."
curl -o tkn.tar.gz -LO https://github.com/tektoncd/cli/releases/download/v0.23.1/tkn_0.23.1_Linux_x86_64.tar.gz
tar xvzf tkn.tar.gz -C /usr/local/bin/ tkn
rm tkn.tar.gz

echo "installing argocd ..."
VERSION=v2.3.3 # Select desired TAG from https://github.com/argoproj/argo-cd/releases
curl -sSL -o /usr/local/bin/argocd https://github.com/argoproj/argo-cd/releases/download/$VERSION/argocd-linux-amd64
chmod +x /usr/local/bin/argocd

echo "install kubectl ..."
apt-get update && apt-get install -y apt-transport-https
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | tee -a /etc/apt/sources.list.d/kubernetes.list
apt-get update
apt-get install -y kubectl

echo "install docker ..."
apt-get install -y ca-certificates curl gnupg lsb-release
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu  $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null
apt-get update

apt-get install -y docker-ce docker-ce-cli containerd.io

echo "cleaning cache ..."
apt-get clean

tkn completion bash >> /completion.sh
argocd completion bash >> /completion.sh
kubectl completion bash >> /completion.sh

