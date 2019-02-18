FROM centos:7

RUN yum -y install gnuplot*
RUN wget http://www.iozone.org/src/current/iozone3_327.tar
RUN tar xvf iozone3_327.tar
RUN /opt/iozone3_327/src/current
RUN make linux
