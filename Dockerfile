#FROM nginx:stable-alpine
#FROM centos/nginx-112-centos7

#LABEL version="1.0"
#RUN cp  /usr/share/zoneinfo/Europe/Istanbul /etc/localtime
#RUN echo  "Europe/Istanbul" /etc/timezone
#add timezone

FROM centos/s2i-core-centos7:1

EXPOSE 8080
EXPOSE 8443

ENV NAME=nginx \
    NGINX_VERSION=1.14 \
    NGINX_SHORT_VER=114 \
    VERSION=0

RUN yum install -y yum-utils gettext hostname && \
    yum install -y centos-release-scl-rh && \
    INSTALL_PKGS="nss_wrapper bind-utils rh-nginx${NGINX_SHORT_VER} rh-nginx${NGINX_SHORT_VER}-nginx \
                  rh-nginx${NGINX_SHORT_VER}-nginx-mod-stream rh-nginx${NGINX_SHORT_VER}-nginx-mod-http-perl" && \
    yum install -y --setopt=tsflags=nodocs $INSTALL_PKGS && \
    rpm -V $INSTALL_PKGS && \
    yum -y clean all --enablerepo='*'
    
    
#COPY nginx.conf /etc/nginx/nginx.conf
#WORKDIR /usr/share/nginx/html

#COPY . .


#RUN yum install -y gcc-c++ make
#RUN curl -sL https://rpm.nodesource.com/setup_14.x | sudo -E bash -
#RUN curl -sL https://rpm.nodesource.com/setup | bash -
#RUN yum install -y nodejs


#RUN     rpm -Uvh http://download.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm
#RUN     yum install -y npm
#ADD . /src
#RUN cd /src; npm install


#RUN npm install stream -save
#RUN npm run dev
#v11.14


