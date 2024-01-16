FROM mcr.microsoft.com/devcontainers/base:alpine-3.18

# Die Variable LANG muss gesetzt werden, damit Python UTF-8 unterstützt.
ENV LANG C.UTF-8
ENV TRIVY_VERSION=0.48.1
ENV HELM_VERSION=3.13.3
ENV YQ_VERSION=4.40.5

RUN apk update && \
    apk add --no-cache graphviz font-droid font-droid curl npm openssl && \
    curl -L https://github.com/plantuml/plantuml/releases/download/v1.2023.13/plantuml-asl-1.2023.13.jar -o /usr/local/bin/plantuml.jar && \
    echo -e '#!/bin/sh\njava -jar /usr/local/bin/plantuml.jar "$@"' > /usr/local/bin/plantuml && \
    chmod +x /usr/local/bin/plantuml

# Install yq
RUN wget https://github.com/mikefarah/yq/releases/download/v${YQ_VERSION}/yq_linux_amd64 -O /usr/bin/yq && \
    chmod +x /usr/bin/yq

# Install Python
RUN apk add --no-cache python3 && \
    apk add --no-cache py3-requests py3-beautifulsoup4 

# Install trivy (vulnerability scanner)
RUN curl --silent -L https://github.com/aquasecurity/trivy/releases/download/v${TRIVY_VERSION}/trivy_${TRIVY_VERSION}_Linux-64bit.tar.gz --output /tmp/trivy.tar.gz && \
    tar xzvf /tmp/trivy.tar.gz -C /usr/local/bin/ trivy && \
    rm -rf /tmp/*

RUN curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 && \
    chmod 700 get_helm.sh && \
    ./get_helm.sh --version v${HELM_VERSION} && \
    rm get_helm.sh

# Install java 17 runtime (temurin)
RUN apk add --no-cache openjdk17-jre-headless maven
    
# Setzen Sie das Arbeitsverzeichnis
WORKDIR /app

# Ändern Sie den Benutzer auf den nicht privilegierten Benutzer
USER vscode

# Starten Sie die interaktive Shell beim Containerstart
CMD ["/bin/sh"]
