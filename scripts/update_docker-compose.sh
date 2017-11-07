#!/usr/bin/env bash
# -*- encoding UTF-8 -*-
# Author: Johny
# curl -L https://github.com/docker/compose/releases/download/$VERSION/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
# chmod +x /usr/local/bin/docker-compose
curl -L http://tool.kuick.cn/docker-compose/$VERSION/docker-compose > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose