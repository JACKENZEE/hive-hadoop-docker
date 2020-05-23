# hive-hadoop-sample
This repo is for studying Hadoop and Hive architecture


## Architecture 

![Architecture](architecture.png)


## Requirements
- AMI: RHEL ver.8 
- Instance Type: t2.large
- Storage: 10GB


## Build

```
$ bash setup.sh 
$ bash build_docker_images.sh 
$ docker-compose up -d 
```


## Start Hadoop 

```
$ docker exec -it $(docker container ls | grep master | awk '{print $1}') bash 

[root] $ hdfs namenode -format
[root] $ bash /opt/hadoop/sbin/start-all.sh 
```