FROM ubuntu:22.04 as builder

MAINTAINER Mohit Kumar <mohitkr05@gmail.com>
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Australia/Melbourne
ENV APP_ROOT=/etc/open5gs


RUN mkdir -p /etc/apt/keyrings && mkdir -p /etc/open5gs && mkdir -p /var/log/open5gs

RUN apt-get -y update &&  \
    apt-get -y install python3-pip python3-setuptools \ 
    python3-wheel ninja-build build-essential flex bison \
    git cmake libsctp-dev libgnutls28-dev libgcrypt-dev \ 
    libssl-dev libidn11-dev libmongoc-dev libbson-dev \
    libyaml-dev libnghttp2-dev libmicrohttpd-dev libcurl4-gnutls-dev \
    libnghttp2-dev libtins-dev libtalloc-dev meson

RUN cd /opt/open5gs && git clone --recursive https://github.com/open5gs/open5gs.git
RUN cd /etc/open5gs/open5gs && meson build --prefix=`pwd`/install && \
    ninja -C build && cd build && ninja install

COPY configs/open5gs/* /etc/open5gs/


