# fluentd/Dockerfile
FROM fluent/fluentd:v1.14-debian-1
USER root

# package manager
RUN apt-get update && apt-get install build-essential curl -y

# install fluentd plugins
RUN fluent-gem install elasticsearch --version 6.8.3
RUN fluent-gem install fluent-plugin-elasticsearch --version 5.0.5
RUN fluent-gem install -N fluent-plugin-rewrite-tag-filter --version 2.3.0
RUN fluent-gem install fluent-plugin-multi-format-parser
RUN fluent-gem install fluent-plugin-kubernetes_metadata_filter
RUN fluent-gem install fluent-plugin-viaq_data_model
RUN fluent-gem install essential
RUN fluent-gem install typhoeus
RUN fluent-gem install fluent-plugin-prometheus
RUN fluent-gem install fluent-plugin-concat
RUN fluent-gem install fluent-plugin-record-modifier --no-document
RUN fluent-gem install fluent-plugin-systemd --version 1.0.3
