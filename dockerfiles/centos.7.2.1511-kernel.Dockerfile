FROM centos:7.2.1511
MAINTAINER seansp@microsoft.com

RUN yum groups mark convert
RUN yum -y groupinstall 'Development Tools'

RUN git clone git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git

# Add the fingerprint '.Dockered' to the #define

RUN cd linux-next
RUN yes "" | make oldconfig
WORKDIR linux-next

RUN make rpm
