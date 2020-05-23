#!/bin/bash

set -e 
sudo docker build -t hdfs-base:latest ./hdfs-base
sudo docker build -t hdfs-masternode:latest ./hdfs-masternode
sudo docker build -t hdfs-slavenode:latest ./hdfs-slavenode
sudo docker build -t db-server:latest ./db-server