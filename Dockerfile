FROM alexlinuxxy/ubuntu_dev_docker
MAINTAINER Alex Huang "nikshuang@163.com"
ENV REFRESHED_AT 2016-6-19

WORKDIR /opt
RUN git clone git://github.com/openstack-dev/devstack.git
WORKDIR /opt/devstack
RUN source openrc admin
COPY localrc /opt/devstack
RUN ./stack.sh
