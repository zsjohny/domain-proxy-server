#!/usr/bin/env bash
# -*- encoding UTF-8 -*-
# Author: Johny

# Env
DOCKER_VERISON=`docker  --version`
COMPOSE_VERISON=`docker-compose  --version`

# 确认系统版本
if test `docker  --version| grep -c 17` -eq 1
then
    echo  You already intall docker to latest version, $DOCKER_VERISON
else
    echo 'You need install docker to latest version,please run update_docker_from_offcial.sh'

fi

if test `docker-compose --version| grep -c 1.15.0` -eq 1
then
    echo  You already intall docker-compose to latest version, $COMPOSE_VERISON
else
    echo 'You need install docker-compose to latest version, please run update_docker-compose.sh'

fi

#sleep 1s

# Prepare Image
