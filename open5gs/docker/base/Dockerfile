# Build AMF
ARG BASE_IMAGE_VERSION=22.04
ARG TZ=Australia/Melbourne
ARG NFV=amf
FROM ubuntu:${BASE_IMAGE_VERSION} AS builder
MAINTAINER Mohit Kumar <mohitkr05@gmail.com>
ENV DEBIAN_FRONTEND=noninteractive


# Create the directories where the git repo will be cloned

RUN mkdir -p /etc/apt/keyrings && mkdir -p /etc/open5gs && mkdir -p /var/log/open5gs
RUN apt-get -y update && apt-get -y install tzdata  && ln -fs /usr/share/zoneinfo/{$TZ} /etc/localtime && \ 
    dpkg-reconfigure --frontend noninteractive tzdata
RUN apt-get install -y software-properties-common gnupg wget build-essential tcpdump python3-pip python3-setuptools \ 
                        python3-wheel ninja-build build-essential flex bison git cmake libsctp-dev libgnutls28-dev \ 
                        libgcrypt-dev libssl-dev libidn11-dev libmongoc-dev libbson-dev libyaml-dev libnghttp2-dev \ 
                        libmicrohttpd-dev libcurl4-gnutls-dev libnghttp2-dev libtins-dev libtalloc-dev meson


RUN cd /etc/open5gs && git clone --recursive https://github.com/open5gs/open5gs.git

#https://open5gs.org/open5gs/docs/guide/02-building-open5gs-from-sources/

RUN cd /etc/open5gs/open5gs && meson build --prefix=`pwd`/install && \
    ninja -C build && cd build && ninja install


CMD ["echo", "base image build complete"]