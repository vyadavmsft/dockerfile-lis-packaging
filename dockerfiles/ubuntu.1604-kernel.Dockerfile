FROM ubuntu:16.04
MAINTAINER vyadav@microsoft.com

RUN apt-get install build-essential

RUN git clone https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
RUN cd /root/linux-next/

WORKDIR /root/linux-next

RUN make-kpkg kernel-image kernel-source --initrd --append-to-version=.hyperv
