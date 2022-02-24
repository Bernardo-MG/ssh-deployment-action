#!/bin/sh
#
# Function for deploying the current folder through SSH

# Fails if any commands returns a non-zero value
set -e

username=${1}
password=${2}
host=${3}
port=${4}
path=${5}

# Deploy
sshpass -p ${password} ssh -o StrictHostKeyChecking=no -p ${port} -r ./* ${username}'@'${host}':'${path};

exit 0
