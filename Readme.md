Docker files and supporting resources for packaging LIS resources.

[Functional Spec](/docs/specification.md)

Example usage:
-------------------------------
<br>git clone https://github.com/openstack-hyper-v/dockerfile-lis-packaging.git
<br>cd dockerfile-lis-packaging
<br>docker build -f centos/centos.7.2.1511.Dockerfile -t centos-7-lis .
<br>docker run -it centos-7-lis bash
<br>]in container] rpmbuild -bb *.spec
