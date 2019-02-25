FROM rook/ceph:v0.9.2

#RUN yum -y install gnuplot* 
RUN yum -y install wget make gcc vim unzip 
RUN wget http://www.iozone.org/src/current/iozone3_327.tar
RUN tar xvf iozone3_327.tar
WORKDIR /iozone3_327/src/current
RUN make linux
COPY stresstest-ceph-rbd.sh /iozone3_327/src/current
RUN chmod +x /iozone3_327/src/current/stresstest-ceph-rbd.sh
COPY toolbox.sh /usr/local/bin
RUN chmod +x /usr/local/bin/toolbox.sh
#CMD ["/bin/bash","-c","/iozone3_327/src/current/stresstest-ceph-rbd.sh"]
