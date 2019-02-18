FROM centos:7

#RUN yum -y install gnuplot*
RUN yum -y install wget
RUN wget http://www.iozone.org/src/current/iozone3_327.tar
RUN tar xvf iozone3_327.tar
RUN /opt/iozone3_327/src/current
RUN make linux
COPY docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh
CMD ["/bin/bash","-c","/docker-entrypoint.sh"]
