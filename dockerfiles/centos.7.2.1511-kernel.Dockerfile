FROM centos:7.2.1511
MAINTAINER seansp@microsoft.com

RUN yum groups mark convert
RUN yum -y groupinstall 'Development Tools'

RUN git clone https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git

# Add the fingerprint '.Dockered' to the #define

RUN cd /root/linux-next
RUN 'y' | make oldconfig
WORKDIR /root/linux-next

RUN make rpm
