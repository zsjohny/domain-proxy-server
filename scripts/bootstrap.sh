#!/usr/bin/env bash
# -*- encoding UTF-8 -*-
# Author: Johny

# Env
DOCKER_VERISON=`docker  --version`
COMPOSE_VERISON=`docker-compose  --version`

echo 请确认您的系统是Linux
sleep 10s

if test `docker  --version| grep -c 17` -eq 1
then
    echo  '您已经安装最新版本docker, $DOCKER_VERISON'
else
    echo '您需要安装最新版本docker,请运行 update_docker_from_offcial.sh'

fi

if test `docker-compose --version| grep -c 1.15.0` -eq 1
then
    echo  '您已经安装最新版本docker-compose, $COMPOSE_VERISON'
else
    echo '您需要安装最新版本docker-compose,请运行update_docker-compose.sh'

fi


# Prepare Image

echo '正在准备二级域名代理服务'
sh ../docker/deploy.sh