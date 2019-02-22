FROM centos:7

#RUN yum -y install gnuplot*
RUN yum -y install wget make gcc 
RUN wget http://www.iozone.org/src/current/iozone3_327.tar
RUN tar xvf iozone3_327.tar
WORKDIR /iozone3_327/src/current
RUN make linux
COPY docker-entrypoint.sh /iozone3_327/src/current
RUN chmod +x /iozone3_327/src/current/docker-entrypoint.sh
CMD ["/bin/bash","-c","/iozone3_327/src/current/docker-entrypoint.sh"]
