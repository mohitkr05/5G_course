# Use a base image with a minimal OS and install necessary dependencies
FROM ubuntu:20.04 as builder

LABEL maintainer="Mohit Kumar <hello@mohitkr.com>"

# Set a default function if not provided
ENV RUN_FUNCTION=amfd  


# Install required packages
RUN apt-get update && \
    apt-get install -y \
    git build-essential cmake libmnl-dev libidn11 libidn11-dev libyaml-dev \
    libssl-dev libcurl4-openssl-dev libmicrohttpd-dev python3 python3-pip

# Clone Open5GS repository
RUN git clone https://github.com/open5gs/open5gs.git /open5gs

# Build and install Open5GS
WORKDIR /open5gs
RUN mkdir build && \
    cd build && \
    cmake ../ && \
    make && \
    make install

# Clean up unnecessary packages and files
RUN apt-get remove -y --purge git build-essential cmake libmnl-dev libidn11-dev \
    libyaml-dev libssl-dev libcurl4-openssl-dev libmicrohttpd-dev && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /open5gs

# Expose ports used by Open5GS
EXPOSE 80 443 3000 8805

# Run the specific function based on the environment variable
CMD ["sh", "-c", "if [ \"$RUN_FUNCTION\" = \"custom_function\" ]; then custom_function; else default_function; fi"]

# Default function
RUN echo "Running default function"

# Custom function (replace this with your actual function)
RUN custom_function() { echo "Running custom function"; }