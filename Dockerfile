FROM centos:centos6.8
MAINTAINER Miguel Cortes <miguel.cortes@decameron.com>
RUN yum update -y
#Se copia esta dependencia de http porque los mirrors de descarga suelen ser muy lentos
COPY redhat-logos-60.0.14-12.el6.centos.noarch.rpm /usr/src/
RUN yum install -y /usr/src/redhat-logos-60.0.14-12.el6.centos.noarch.rpm
RUN yum install -y vi httpd mod_ssl php
#Extensiones php
RUN yum install -y php-mbstring
# Abrir puerto? >> iptables -I INPUT -p tcp --dport 80 -j ACCEPT
EXPOSE 80
ENTRYPOINT /usr/sbin/apachectl start && /bin/bash;
