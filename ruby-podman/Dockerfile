ARG ruby_version=latest
FROM ruby:$ruby_version

RUN apt-get update && apt-get install curl
RUN curl -fsSL -o /tmp/podman-linux-amd64.tar.gz https://github.com/mgoltzsche/podman-static/releases/download/v3.1.2/podman-linux-amd64.tar.gz \
      && tar -xzf /tmp/podman-linux-amd64.tar.gz \
      && cp -r /tmp/podman-linux-amd64/usr /tmp/podman-linux-amd64/etc /
