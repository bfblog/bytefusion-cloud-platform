FROM alpine:latest

RUN apk update && apk upgrade 
RUN apk add tree git curl coreutils make gnupg tzdata maven docker-cli

# yq
RUN curl --silent -L https://github.com/mikefarah/yq/releases/download/v4.33.2/yq_linux_amd64 --output /usr/local/bin/yq ; chmod +x /usr/local/bin/yq

# jq
RUN curl --silent -L https://github.com/stedolan/jq/releases/download/jq-1.6/jq-linux64 --output /usr/local/bin/jq ; chmod +x /usr/local/bin/jq
    
# tekton-cli
RUN set -x && export TEKTON_VERSION=$(curl -s  https://api.github.com/repos/tektoncd/cli/releases/latest | jq --raw-output '.tag_name' | sed 's/^.//') && \
    curl --output /tmp/tkn.tar.gz --silent -L https://github.com/tektoncd/cli/releases/download/v$TEKTON_VERSION/tkn_${TEKTON_VERSION}_Linux_x86_64.tar.gz && \
    tar xvzf /tmp/tkn.tar.gz -C /usr/local/bin/ tkn && \
    rm /tmp/tkn.tar.gz 

# argocd cli
RUN curl --output /usr/local/bin/argocd --silent -L https://github.com/argoproj/argo-cd/releases/latest/download/argocd-linux-amd64 && \
    chmod +x /usr/local/bin/argocd
    
# kubectl
RUN set -x && curl --silent -L https://dl.k8s.io/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl --output /usr/local/bin/kubectl && \
    chmod +x /usr/local/bin/kubectl && \
    rm -rf /tmp/*

RUN curl --silent -L https://github.com/aquasecurity/trivy/releases/download/v0.38.3/trivy_0.38.3_Linux-64bit.tar.gz --output /tmp/trivy.tar.gz && \
    tar xzvf /tmp/trivy.tar.gz -C /usr/local/bin/ trivy && \
    rm -rf /tmp/*

RUN curl --silent -L https://get.helm.sh/helm-v3.11.1-linux-amd64.tar.gz --output /tmp/helm.tar.gz && tar xzvf /tmp/helm.tar.gz -C /tmp && cp /tmp/linux-amd64/helm /usr/local/bin/helm && rm -rf /tmp/*

RUN adduser --disabled-password --home /home/developer developer
RUN addgroup developer root
    
WORKDIR /workspace
USER developer
