FROM centos:7

ENV XAMPP_VERSION 7.4.9

LABEL maintainer="[XAMPP] Maintainers <ydj317@163.com>"

COPY ./xampp.tar.gz /tmp/xampp.tar.gz

RUN yum update && \
    yum install -y net-tools

RUN tar -zxvf /tmp/xampp.tar.gz

EXPOSE 80
EXPOSE 443
EXPOSE 3306

VOLUME ["/opt/lampp/etc", "/opt/lampp/var"]