FROM daocloud.io/centos
MAINTAINER bighenry hh10241123@gmail.com
WORKDIR /root/
#RUN yum -y install mysql-server
COPY rpm /opt/
ENV TERM linux
RUN rpm -ivh /opt/*.rpm
RUN mysql_install_db --user=mysql
ENV MYSQL_USER admin
ENV MYSQL_PASS 123456
ENV LC_ALL en_US.UTF-8
ADD build_table.sh /root/build_table.sh
RUN chmod +x /root/build_table.sh
RUN /root/build_table.sh 
EXPOSE 3306
#ADD run.sh /root/run.sh
#RUN chmod +x /root/run.sh
RUN rm /opt -rf
#CMD /root/run.sh 
CMD mysqld_safe
