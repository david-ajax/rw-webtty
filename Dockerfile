FROM ubuntu:20.04

ARG TARGETARCH
COPY ./dist/${TARGETARCH}/ttyd /usr/bin/ttyd
RUN apt-get update && apt-get install -y --no-install-recommends tini && rm -rf /var/lib/apt/lists/*
RUN apt-get install sudo python3 python3-dev python3-pip build-essential manpages-dev nano busybox wget lynx git vim matrix ssh --no-install-recommends -y
RUN busybox --install

EXPOSE 7681
WORKDIR /root

ENTRYPOINT ["/usr/bin/tini", "--"]
CMD ttyd -p 80 -c ajax:200juice -a
