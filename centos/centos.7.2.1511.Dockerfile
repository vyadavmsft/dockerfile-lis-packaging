FROM centos:7.2.1511

RUN yum -y groupinstall 'Development Tools'

RUN mkdir /root/rpmbuild
RUN mkdir /root/rpmbuild/BUILD
RUN mkdir /root/rpmbuild/RPMS
RUN mkdir /root/rpmbuild/SOURCES
RUN mkdir /root/rpmbuild/SPECS
RUN mkdir /root/rpmbuild/SRPMS
RUN git clone https://github.com/LIS/lis-next
RUN tar -czf /root/rpmbuild/SOURCES/lis-next-rh6.tar.gz /lis-next

ADD lis-rhel6.spec /root/rpmbuild/SPECS/lis-rhel6.spec

RUN cd /root/rpmbuild
RUN echo '%_topdir %(echo $HOME)/rpmbuild' > /root/.rpmmacros
RUN cd /root/rpmbuild/SPEC

#RUN rpmbuild -bb *.spec
