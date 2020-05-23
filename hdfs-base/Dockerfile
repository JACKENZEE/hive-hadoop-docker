FROM centos:6.9

# clean install 
RUN yum -y update && \
        yum clean all && \
            yum -y install tar sed wget openssh-server openssh-clients unzip lsof 



# install java ver1.8
RUN yum install -y java-1.8.0-openjdk java-1.8.0-openjdk-devel



# install hadoop ver3.2.1
RUN wget --no-verbose http://downloads.apache.org/hadoop/common/hadoop-3.2.1/hadoop-3.2.1.tar.gz && \
        tar -xzf hadoop-3.2.1.tar.gz && \
            mv hadoop-3.2.1 /opt/hadoop && \
                rm hadoop-3.2.1.tar.gz



# make directories for hdfs
RUN mkdir /opt/hadoop/data && \
            mkdir /opt/hadoop/name && \
                mkdir /opt/yarn



# copy configration files 
COPY config/core-site.xml /opt/hadoop/etc/hadoop/
COPY config/hdfs-site.xml /opt/hadoop/etc/hadoop/
COPY config/mapred-site.xml /opt/hadoop/etc/hadoop/
COPY config/yarn-site.xml /opt/hadoop/etc/hadoop/
COPY config/workers /opt/hadoop/etc/hadoop/


# copy environment file
COPY config/hadoop-env.sh /opt/hadoop/etc/hadoop/



# set environment variables
ENV JAVA_HOME=/usr/lib/jvm/jre-1.8.0-openjdk.x86_64
ENV HADOOP_HOME=/opt/hadoop
ENV HADOOP_CONF_DIR=/opt/hadoop/etc/hadoop
ENV HADOOP_LOG_DIR=/opt/hadoop/logs
ENV PATH=$PATH:/opt/hadoop/bin/  



RUN echo "export JAVA_HOME=${JAVA_HOME}" >> /opt/hadoop/etc/hadoop/hadoop-env.sh
RUN echo "export HDFS_NAMENODE_USER='root'" >> /opt/hadoop/etc/hadoop/hadoop-env.sh
RUN echo "export HDFS_DATANODE_USER='root'" >> /opt/hadoop/etc/hadoop/hadoop-env.sh
RUN echo "export HDFS_JOURNALNODE_USER='root'" >> /opt/hadoop/etc/hadoop/hadoop-env.sh
RUN echo "export HDFS_SECONDARYNAMENODE_USER='root'" >> /opt/hadoop/etc/hadoop/hadoop-env.sh
RUN echo "export YARN_RESOURCEMANAGER_USER='root'" >> /opt/hadoop/etc/hadoop/hadoop-env.sh
RUN echo "export YARN_NODEMANAGER_USER='root'" >> /opt/hadoop/etc/hadoop/hadoop-env.sh 
RUN echo "export HADOOP_MAPRED_HOME='/opt/hadoop'" >> /opt/hadoop/etc/hadoop/hadoop-env.sh 
RUN echo "export HADOOP_COMMON_HOME='/opt/hadoop'" >> /opt/hadoop/etc/hadoop/hadoop-env.sh 
RUN echo "export HADOOP_HDFS_HOME='/opt/hadoop'" >> /opt/hadoop/etc/hadoop/hadoop-env.sh 
RUN echo "export YARN_HOME='/opt/hadoop'" >> /opt/hadoop/etc/hadoop/hadoop-env.sh 

COPY config/conf.sh /tmp/

# ssh wihtout password 
RUN ssh-keygen -q -N "" -t rsa -f /root/.ssh/id_rsa 
RUN mkdir -p /root/.ssh 
COPY config/ssh_config /root/.ssh/
RUN cat /root/.ssh/id_rsa.pub >> /root/.ssh/authorized_keys
RUN chmod 0600 ~/.ssh/authorized_keys


