FROM centos:7

ENV XAMPP_VERSION 7.4.9

LABEL maintainer="[XAMPP] Maintainers <ydj317@163.com>"

# COPY ./xampp.tar.gz /tmp/xampp.tar.gz
RUN curl -o /tmp/xampp-installer.run https://jaist.dl.sourceforge.net/project/xampp/XAMPP%20Linux/7.4.9/xampp-linux-x64-7.4.9-0-installer.run && \
    chmod +x /tmp/xampp-installer.run

RUN yum update && \
    yum install -y net-tools