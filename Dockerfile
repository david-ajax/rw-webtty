FROM debian:latest

RUN echo "PKG INST I"
RUN apt-get update && apt-get install -y --no-install-recommends tini
RUN echo "PKG INST II"
RUN apt-get update && apt-get install sudo python3 python3-dev python3-pip build-essential manpages-dev nano busybox wget lynx git vim fim ssh --no-install-recommends -y
RUN echo "TTYD INST"
RUN wget https://github.com/tsl0922/ttyd/releases/download/1.7.3/ttyd.x86_64 -P /bin
RUN mv /bin/ttyd.x86_64 /bin/ttyd
RUN chmod 777 /bin/ttyd
RUN busybox --install

EXPOSE 80
EXPOSE 22
EXPOSE 23
EXPOSE 24
EXPOSE 21
EXPOSE 25
EXPOSE 8080
EXPOSE 8081
EXPOSE 8082
EXPOSE 8083
EXPOSE 8084
EXPOSE 8085
EXPOSE 6080
EXPOSE 3386
EXPOSE 5900
WORKDIR /root

ENTRYPOINT ["/usr/bin/tini", "--"]
CMD ttyd -p 80 -c ajax:200juice -a
