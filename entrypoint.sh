#!/bin/sh

#
# Deploys folder contents through SSH.
#
# -- PARAMETERS --
#
# - $1: string, username for the deployment server
# - $2: string, password for the deployment server
# - $3: string, host to deploy to
# - $4: string, host port
# - $5: string, path in the host where the files will be deployed
#
# -- EFFECTS --
#
# - The folder contents get deployed at the host
#

# Fails if any commands returns a non-zero value
set -e

# Read input parameters
username=${1}
password=${2}
host=${3}
port=${4}
path=${5}

# Deploy
sshpass -p "${password}" scp -o StrictHostKeyChecking=no -P ${port} -rp ./* ${username}'@'${host}':'${path};

exit 0
