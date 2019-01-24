#!/usr/bin/env bash
# -*- encoding UTF-8 -*-
# Author: Johny

export PGRDIR=$(cd `dirname $0`; pwd)
export VERSION=$1

source $PGRDIR/env.sh

export DOCKER_OPTS="-p $DOCKER_INSTANCE_PORT:80 \
"

# only set VERSION if not set
[ -z "$VERSION" ] && VERSION=latest

echo step1. rm  $DOCKER_INSTANCE_NAME
docker rm -f $DOCKER_INSTANCE_NAME

echo step2. run $DOCKER_INSTANCE_NAME
docker run --name=$DOCKER_INSTANCE_NAME --hostname=$DOCKER_INSTANCE_NAME -d -v certs:/etc/nginx/certs --restart=always $DOCKER_OPTS $DOCKER_REGISTRY_URL/$DOCKER_IMAGE_NAME:$VERSION