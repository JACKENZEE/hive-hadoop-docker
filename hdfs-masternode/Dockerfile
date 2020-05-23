FROM hdfs-base

ENV HADOOP_HOME=/opt/hadoop
ENV HADOOP_CONF_DIR=/opt/hadoop/etc/hadoop 


COPY run.sh /opt/hadoop/run.sh
RUN chmod a+x /opt/hadoop/run.sh 


RUN wget http://archive.apache.org/dist/hive/hive-3.1.2/apache-hive-3.1.2-bin.tar.gz && \
        tar -xzf apache-hive-3.1.2-bin.tar.gz && \
         mv apache-hive-3.1.2-bin /opt/hive && \
            rm apache-hive-3.1.2-bin.tar.gz


ENV HIVE_HOME=/opt/hive
ENV PATH=$PATH:/opt/hive/bin:/opt/hive/sbin 

RUN wget http://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-5.1.46.tar.gz && \
        tar -xzf mysql-connector-java-5.1.46.tar.gz && \
            mv mysql-connector-java-5.1.46/mysql-connector-java-5.1.46-bin.jar  /opt/hive/lib && \
                rm /opt/hive/lib/guava-19.0.jar
                
                
COPY guava-27.0-jre.jar /opt/hive/lib/
COPY hive-site.xml /opt/hive/conf/hive-site.xml


COPY sample_data.zip /tmp/
RUN unzip /tmp/sample_data.zip


CMD ["/bin/bash", "/opt/hadoop/run.sh"]
