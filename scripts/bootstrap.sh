#!/usr/bin/env bash
# -*- encoding UTF-8 -*-
# Author: Johny

# Env
DOCKER_VERISON=`docker  --version`
COMPOSE_VERISON=`docker-compose  --version`

echo 请确认您的系统是Linux
sleep 5s

if test `docker  --version| grep -c 17` -eq 1
then
    echo '您已经安装最新版本docker', $DOCKER_VERISON
else
    echo '您需要安装最新版本docker,请运行 update_docker_from_offcial.sh'
    exit
fi

if test `docker-compose --version| grep -c 1.17.0` -eq 1
then
    echo '您已经安装最新版本docker-compose', $COMPOSE_VERISON
else
    echo '您需要安装最新版本docker-compose,请运行update_docker-compose.sh'
    ./update_docker-compose.sh
fi


# Prepare Image
echo -e "\033[33m请确保docker proxy已经切换到国内镜像点。\033[0m"
sleep 3s
echo -e "\033[33m正在准备二级域名代理服务......\033[0m"
sleep 1s

echo -e "\033[32m请确保80端口没有被占用！\033[0m";
sleep 3s

../docker/deploy.sh

if [ $? -eq 0 ]
then
echo -e "\033[32m部署成功！ \033[0m";
else
echo -e "\033[31m部署失败,请检查本地网络及代理设置。\033[0m"
fi