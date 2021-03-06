FROM centos/nginx-112-centos7

LABEL version="1.0"
#RUN cp  /usr/share/zoneinfo/Europe/Istanbul /etc/localtime
#RUN echo  "Europe/Istanbul" /etc/timezone

#COPY nginx.conf /etc/nginx/nginx.conf
#WORKDIR /usr/share/nginx/html

#RUN useradd -u 1001 -r -g 0 -d ${HOME} -s /sbin/nologin -c "Default Application User" default \
#    && mkdir -p ${HOME} \
#    && chown -R 1001:0 ${HOME} && chmod -R g+rwX ${HOME}

WORKDIR ./
COPY . ./

USER root
RUN yum install -y gcc-c++ make
RUN curl -sL https://rpm.nodesource.com/setup_14.x | bash -
#RUN curl -sL https://rpm.nodesource.com/setup | bash -
RUN yum install -y nodejs


RUN npm install stream -save
#RUN chown -R nginx: /opt/app-root/src 
#RUN npm ng serve

EXPOSE 8080
CMD ["nginx","-g","daemon off;"]

#v11.14
