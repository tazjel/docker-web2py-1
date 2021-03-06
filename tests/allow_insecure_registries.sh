#!/bin/bash

MYDIR=`dirname $0`
INSECURE_FILE_NAME=sample_insecure_daemon.json
INSECURE_FILE=$MYDIR/$INSECURE_FILE_NAME

. $MYDIR/../env_for_cluster.sh

echo "create a new /etc/docker/daemon.json with the following content"
cat $INSECURE_FILE
echo "Please make sure the hostname is correct."
echo "You can edit the file $INSECURE_FILE_NAME and re-run this script."
set -x # echo on

echo "{\"insecure-registries\" : [\"$REGISTRY_HOSTNAME:$REGISTRY_PUBLISHED_PORT\"]}" | sudo tee -a /etc/docker/daemon.json

sudo service docker restart
