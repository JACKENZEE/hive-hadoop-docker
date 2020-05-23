#!/bin/bash

source /tmp/conf.sh

# add hosts
echo '172.20.0.2    namenode' >> /etc/hosts
echo '172.20.0.3    datanode1' >> /etc/hosts
echo '172.20.0.4    datanode2' >> /etc/hosts
echo '172.20.0.5    datanode3' >> /etc/hosts
echo '172.20.0.6    db-server' >> /etc/hosts


# start sshd 
service sshd start 

# keep container running
tail -f /dev/null
