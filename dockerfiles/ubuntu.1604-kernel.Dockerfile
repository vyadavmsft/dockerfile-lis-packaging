FROM ubuntu:16.04
MAINTAINER vyadav@microsoft.com

ENV CONCURRENCY_LEVEL=16

RUN apt-get update -y && apt-get install git  kernel-package build-essential -y

RUN git clone git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git /usr/src/linux-next
RUN cd /usr/src/linux-next && make-kpkg kernel-image kernel-source --initrd --append-to-version=.hyperv

