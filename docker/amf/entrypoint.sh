#!/bin/bash

set -eo pipefail

user_argument=$1

# The components are only for 5G deployment
network_functions=("amf" "ausf" "bsf" "nrf" "scp" "nssf" "pcf" "smf" "udm" "udr" "upf" "webui" "login")
valid_arguments=("${network_functions[@]}")

# Check if there is at least one argument
if [ $# -eq 0 ]; then
    echo "Usage: $0 <argument>"
    exit 1
fi

# Check if the argument is valid and is in the array
if [[ " ${valid_arguments[@]} " =~ " $user_argument " ]]; then
    if [[ "login" == "$user_argument" ]]; then
    echo "Logging in the container"
    /bin/bash
    else
    echo "Running container: $user_argument"
    echo "Running script in /etc/open5gs/open5gs/install/bin"
    scriptname= open5gs-"$user_argument"d
    echo "$scriptname"
    cd /etc/open5gs/open5gs/install/bin && ./$scriptname
    fi
else
    echo "Invalid argument. Valid options are: ${valid_arguments[@]}"
    exit 1
fi

