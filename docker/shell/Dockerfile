# fluentd/Dockerfile
FROM ubuntu:latest

ADD install.sh /root/install.sh

WORKDIR /root

RUN apt update && apt upgrade && apt install -y dos2unix
RUN chmod +x /root/install.sh 
RUN dos2unix /root/install.sh && /root/install.sh

#RUN apt update && apt upgrade && apt install -y gnupg curl
#RUN useradd -s /bin/bash -d /home/anonymous/ -m -G sudo anonymous 
#RUN curl -sL https://get.keptn.sh | bash
#RUN curl -LO https://github.com/tektoncd/cli/releases/download/v0.23.0/tektoncd-cli-0.23.0_Linux-64bit.deb && apt update && apt install -y tektoncd-cli
