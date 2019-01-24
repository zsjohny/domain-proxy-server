#!/usr/bin/env bash
# -*- encoding UTF-8 -*-
# Author: Johny


# improvement by tripleee
GIT_VERISON=`git --version`
GIT_IS_AVAILABLE=$?

# ...
if [ $GIT_IS_AVAILABLE -eq 0 ];
then
    echo  '您已经安装最新版本git', $GIT_VERISON
    git clone https://github.com/KuickDeal/domain-proxy-server.git
    cd domain-proxy-server/scripts &&  ./bootstrap.sh
else
    echo '您需要安装最新版本git!'

fi