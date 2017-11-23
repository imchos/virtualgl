FROM ubuntu:16.04

WORKDIR /root

RUN apt-get update &&\
    apt-get -y install wget

# for Xdummy
RUN apt-get -y install xserver-xorg-video-dummy
RUN wget http://xpra.org/xorg.conf

# for VirtualGL
RUN wget https://sourceforge.net/projects/virtualgl/files/2.5.2/virtualgl_2.5.2_amd64.deb &&\
    dpkg -i virtualgl_2.5.2_amd64.deb

# remove unused files
RUN rm -rf /var/lib/apt/lists/* &&\
    rm virtualgl_2.5.2_amd64.deb

COPY docker-entrypoint.sh .
RUN chmod 755 docker-entrypoint.sh
ENTRYPOINT ["./docker-entrypoint.sh"]
