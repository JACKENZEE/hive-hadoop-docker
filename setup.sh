#!/bin/bash

# update software
sudo yum -y update 

# add docker-ce to the external repository 
sudo dnf config-manager --add-repo=https://download.docker.com/linux/centos/docker-ce.repo

# check the repository list
sudo dnf repolist -v
sudo dnf list docker-ce --showduplicates | sort -r

# install the latest version of docker CE
sudo dnf install -y --nobest docker-ce-18.06.3.ce

# start and enable docker-daemon
sudo systemctl enable --now docker

# check status of docker-daemon
systemctl is-active docker 
systemctl is-enabled docker 


# install docker-compose
sudo dnf install -y python3-pip
pip3 --version
pip3 install docker-compose --user

docker-compose --version
