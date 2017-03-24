FROM centos:7.2.1511
MAINTAINER seansp@microsoft.com
ENV CONCURRENCY_LEVEL 16
RUN yum groups mark convert
RUN yum -y groupinstall 'Development Tools'
RUN git clone git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git /usr/local/src/linux-next
RUN cd /usr/local/src/linux-next &&  yes "" | make oldconfig && make rpm
