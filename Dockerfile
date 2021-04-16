FROM debian:9
MAINTAINER Joel Ward <jmward@gmail.com>
ADD root /root
WORKDIR  /root
RUN sh   /root/install.sh && rm /root/install.sh
EXPOSE 4242 4243
