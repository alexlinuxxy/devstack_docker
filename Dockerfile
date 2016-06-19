FROM alexlinuxxy/ubuntu_dev_docker
MAINTAINER Alex Huang "nikshuang@163.com"
ENV REFRESHED_AT 2016-6-19

RUN useradd -m stack
RUN echo "stack:stack" | chpasswd
ENV TOP_DIR /home/stack

WORKDIR $TOP_DIR
USER stack

RUN git clone git://github.com/openstack-dev/devstack.git
COPY localrc $TOP_DIR/devstack
WORKDIR devstack
RUN [ "/usr/bin/env", "bash", "openrc", "admin" ]
RUN [ "/usr/bin/env", "bash", "stack.sh" ]
