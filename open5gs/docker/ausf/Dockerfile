# Now we can use the base image that we have uploaded to docker hub
FROM krmohit/open5gs-base:01
# Build ausf
ARG BASE_IMAGE_VERSION=22.04
ARG TZ=Australia/Melbourne
ARG NFV=ausf


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

COPY ${NFV}.yaml /etc/open5gs/open5gs/install/etc/open5gs/${NFV}.yaml
WORKDIR ${APP_ROOT}

CMD ["/etc/open5gs/open5gs/install/bin/open5gs-ausfd"]