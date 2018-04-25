#!/usr/bin/env bash
# -*- encoding UTF-8 -*-
# Author: Johny

#GetOSVersion
OS="UnknownOS"
ERROR="0"
# Find the major type first
if [ "`which lsb_release 2> /dev/null`" != "" ]; then
  DIST_ID=`lsb_release -i | awk '{ print $3; }'`
  VERSION=`lsb_release -r | awk '{ print $2; }' | sed 's/\..*//'`
  OS="${DIST_ID}-${VERSION}"
elif [ -e "/etc/debian_version" ]; then
  OS="Debian-`cat /etc/debian_version | sed 's/\..*//'`"
elif [ -e "/etc/centos-release" ]; then
  OS="`cat /etc/centos-release | awk '{ print $1; }' | sed 's/\..*//'`"
  OS="${OS}-`cat /etc/centos-release | awk '{ print $3; }' | sed 's/\..*//'`"
else
  ERROR="1"
fi

echo "$OS"

if [ "$OS" = "Ubuntu-14" ] || [ "$OS" = "Ubuntu-16" ]; then 
  echo "请运行脚本 update_docker_from_offcial.sh"
elif [ "$OS" = "CentOS-6" ]; then
  echo "请升级至CentOS-7"
else
  echo "准备安装docker17."
  sleep 5s
  
yum remove docker \
                  docker-client \
                  docker-client-latest \
                  docker-common \
                  docker-latest \
                  docker-latest-logrotate \
                  docker-logrotate \
                  docker-selinux \
                  docker-engine-selinux \
                  docker-engine
                  
yum clean all

yum install -y yum-utils \
  device-mapper-persistent-data \
  lvm2
  
yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo 
    
# Optional: Enable the edge and test repositories. These repositories are included in the docker.repo file above but are disabled by default. You can enable them alongside the stable repository.
# sudo yum-config-manager --enable docker-ce-edge
# sudo yum-config-manager --enable docker-ce-test
# sudo yum-config-manager --disable docker-ce-edge

# yum list docker-ce --showduplicates | sort -r

yum install -y docker-ce-17.06.2.ce-1.el7.centos

fi
