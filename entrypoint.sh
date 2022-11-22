#!/bin/sh

#
# Deploys folder contents through SSH.
#
# -- PARAMETERS --
#
# - $1: string, username for deployment
# - $2: string, password for deployment
# - $3: string, host where the folder will be deployed
# - $4: string, host port for deployment
# - $5: string, path inside the host where the files will be deployed
# - $6: string, local folder containing the files to deploy
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
folder=${6}

# Move to the folder to deploy
cd ${folder}

# Deploy
sshpass -p "${password}" scp -o StrictHostKeyChecking=no -P ${port} -rp ./* ${username}'@'${host}':'${path};

exit 0
