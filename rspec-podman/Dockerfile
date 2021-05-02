ARG ruby_version=latest
FROM ruby:$ruby_version

WORKDIR /tmp
RUN apt-get update && apt-get install curl
RUN curl -fsSL -o podman-linux-amd64.tar.gz https://github.com/mgoltzsche/podman-static/releases/download/v3.1.2/podman-linux-amd64.tar.gz \
      && tar -xzf podman-linux-amd64.tar.gz \
      && cp -r podman-linux-amd64/usr podman-linux-amd64/etc /

RUN mkdir /opt/rspec-podman
WORKDIR /opt/rspec-podman

COPY $PWD/Gemfile .
COPY $PWD/Gemfile.lock .

RUN bundle install
