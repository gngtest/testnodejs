#FROM nginx:stable-alpine
FROM centos/nginx-112-centos7

LABEL version="1.0"
#RUN cp  /usr/share/zoneinfo/Europe/Istanbul /etc/localtime
#RUN echo  "Europe/Istanbul" /etc/timezone
#add timezone

COPY nginx.conf /etc/nginx/nginx.conf

WORKDIR /usr/share/nginx/html




#RUN yum install -y gcc-c++ make
#RUN curl -sL https://rpm.nodesource.com/setup_14.x | sudo -E bash -
RUN curl -sL https://rpm.nodesource.com/setup | bash -
RUN yum install -y nodejs


#RUN     rpm -Uvh http://download.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm
#RUN     yum install -y npm
#ADD . /src
#RUN cd /src; npm install


RUN npm install stream -save
RUN npm run dev
#v11.14

COPY . .
