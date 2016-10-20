FROM alpine
MAINTAINER Guy Pascarella <guy.pascarella@gmail.com>

#ENV DEBIAN_FRONTEND noninteractive

RUN echo "@testing http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
    apk update

RUN apk add --no-cache \
    make \
    cmake \
    expat-dev \
    g++ \
    git \
    boost-dev \
    boost-filesystem \
    boost-system \
    boost-thread \
    libbz2 \
    proj4-dev@testing \
    geos-dev@testing \
    lua5.2-dev \
    libpq \
    lua5.2

#    protobuf-c-dev \
#    libtool \
#    libxml2-dev \
#    protobuf-c
#    libgeos++-dev \

ENV HOME /root
ENV OSM2PGSQL_VERSION 0.90.1

RUN mkdir src &&\
    cd src &&\
    git clone --depth 1 --branch $OSM2PGSQL_VERSION https://github.com/openstreetmap/osm2pgsql.git &&\
    cd osm2pgsql &&\
    mkdir build &&\
    cd build &&\
    cmake .. &&\
    make &&\
    make install &&\
    cd /root &&\
    rm -rf src

ENTRYPOINT ["/bin/bash"]
