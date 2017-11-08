#/bin/bash

# How do I fix a “Problem with MergeList” or “status file could not be parsed” error when trying to do an update?
# sudo rm -vf /var/lib/apt/lists/*
# fix miss depend https://askubuntu.com/questions/140246/how-do-i-resolve-unmet-dependencies-after-adding-a-ppa

sudo apt-get update

sudo apt-get install -y linux-image-extra-$(uname -r) linux-image-extra-virtual
sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update
sudo apt-get purge docker-ce -y
sudo apt-get install -y --force-yes docker-ce=$VERSION
