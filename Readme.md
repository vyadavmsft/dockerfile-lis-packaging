Docker files and supporting resources for packaging LIS resources.

[Functional Spec](/docs/specification.md)

Example usage:
-------------------------------
git clone https://github.com/openstack-hyper-v/dockerfile-lis-packaging.git
cd dockerfile-lis-packaging
docker build -f centos/centos.7.2.1511.Dockerfile -t centos-7-lis .
docker run -it centos-7-lis bash
]in container] rpmbuild -bb *.spec
