FROM centos:7
RUN yum -y install wget && wget -P /root/ https://www.php.net/distributions/php-7.2.18.tar.gz && yum clean all && cd /root && tar zxvf php-7.2.18.tar.gz && rm -rf php-7.2.18.tar.gz