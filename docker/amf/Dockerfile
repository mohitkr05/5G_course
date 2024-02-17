# Build AMF
FROM ubuntu:22.04 AS builder

MAINTAINER Mohit Kumar <mohitkr05@gmail.com>
ENV DEBIAN_FRONTEND=noninteractive
RUN mkdir -p /etc/apt/keyrings && mkdir -p /etc/open5gs && mkdir -p /var/log/open5gs
ENV TZ=Australia/Melbourne
RUN apt-get -y update
RUN apt-get install -y software-properties-common gnupg wget build-essential tcpdump python3-pip python3-setuptools \ 
                        python3-wheel ninja-build build-essential flex bison git cmake libsctp-dev libgnutls28-dev \ 
                        libgcrypt-dev libssl-dev libidn11-dev libmongoc-dev libbson-dev libyaml-dev libnghttp2-dev \ 
                        libmicrohttpd-dev libcurl4-gnutls-dev libnghttp2-dev libtins-dev libtalloc-dev meson


RUN cd /etc/open5gs && git clone --recursive https://github.com/open5gs/open5gs.git
#https://open5gs.org/open5gs/docs/guide/02-building-open5gs-from-sources/
RUN cd /etc/open5gs/open5gs && meson build --prefix=`pwd`/install && \
    ninja -C build && cd build && ninja install


COPY configs/open5gs/* /etc/open5gs/

# App image

FROM ubuntu:22.04
ENV TZ=Australia/Melbourne

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get install -y \
        curl \
        iproute2 \
        iputils-ping \
        net-tools \
        iptables \
        software-properties-common gnupg wget build-essential tcpdump python3-pip python3-setuptools \ 
                        python3-wheel ninja-build build-essential flex bison git cmake libsctp-dev libgnutls28-dev \ 
                        libgcrypt-dev libssl-dev libidn11-dev libmongoc-dev libbson-dev libyaml-dev libnghttp2-dev \ 
                        libmicrohttpd-dev libcurl4-gnutls-dev libnghttp2-dev libtins-dev libtalloc-dev meson
        
ENV APP_ROOT=/etc/open5gs

COPY --from=builder /etc/open5gs ${APP_ROOT}

ENV PATH=${APP_ROOT}/bin:${PATH} HOME=${APP_ROOT}
WORKDIR ${APP_ROOT}

COPY entrypoint.sh /entrypoint.sh

# ENTRYPOINT ["/entrypoint.sh"]
CMD ["/bin/bash"]

