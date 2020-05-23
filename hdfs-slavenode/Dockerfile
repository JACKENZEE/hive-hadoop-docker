FROM hdfs-base

ENV HADOOP_HOME=/opt/hadoop
ENV HADOOP_CONF_DIR=/opt/hadoop/etc/hadoop 


COPY run.sh /opt/hadoop/run.sh
RUN chmod a+x /opt/hadoop/run.sh 

CMD ["/bin/bash", "/opt/hadoop/run.sh"]
