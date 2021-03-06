FROM oraclelinux:7.1
MAINTAINER seansp@microsoft.com

RUN yum -y groupinstall 'Development Tools'
RUN mkdir /root/rpmbuild
RUN mkdir /root/rpmbuild/BUILD
RUN mkdir /root/rpmbuild/RPMS
RUN mkdir /root/rpmbuild/SOURCES
RUN mkdir /root/rpmbuild/SPECS
RUN mkdir /root/rpmbuild/SRPMS

RUN git clone https://github.com/LIS/lis-next
RUN mv /lis-next/hv-rhel7.x/hv /hv
# Add the fingerprint '.Dockered' to the #define
RUN sed -i -E "s/(HV_DRV_VERSION\t)(\")(.*)(\")/\1\2\3.Dockered\4/" /hv/include/linux/hv_compat.h
RUN tar -czf /root/rpmbuild/SOURCES/lis-next-rh7.tar.gz /hv

ADD specs/lis-centos7.spec /root/rpmbuild/SPECS/lis-centos7.spec
ADD static/100-balloon.rules /root/rpmbuild/SOURCES/100-balloon.rules
ADD static/hypervfcopy /root/rpmbuild/SOURCES/hypervfcopy
ADD static/hypervkvpd /root/rpmbuild/SOURCES/hypervkvpd
ADD static/hypervvssd /root/rpmbuild/SOURCES/hypervvssd

RUN cd /root/rpmbuild
RUN echo '%_topdir %(echo $HOME)/rpmbuild' > /root/.rpmmacros
WORKDIR /root/rpmbuild/SPECS

RUN rpmbuild -bb *.spec
