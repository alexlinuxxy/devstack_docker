FROM alexlinuxxy/ubuntu_dev_docker
MAINTAINER Alex Huang "nikshuang@163.com"
ENV REFRESHED_AT 2016-6-19

ADD devstack.tar.bz2 /work/devstack
WORKDIR /work/devstack
RUN source openrc admin
RUN ./stack.sh
