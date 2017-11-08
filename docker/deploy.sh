#!/usr/bin/env bash
# -*- encoding UTF-8 -*-
# Author: Johny

export PGRDIR=$(cd `dirname $0`; pwd)
export VERSION=$1
export NGINX_CONF=$PGRDIR/conf/nginx.conf
export NGINX_CONFD=$PGRDIR//conf.d/



source $PGRDIR/env.sh

# only set VERSION if not set
[ -z "$VERSION" ] && VERSION=latest

# break shell when fail
set -e

cd $PGRDIR && docker-compose up -d