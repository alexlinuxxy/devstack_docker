FROM alexlinuxxy/ubuntu_dev_docker
MAINTAINER Alex Huang "nikshuang@163.com"
ENV REFRESHED_AT 2016-6-19

USER stack
RUN pwd
RUN git clone git://github.com/openstack-dev/devstack.git
WORKDIR devstack
RUN [ "/usr/bin/env", "bash", "openrc", "admin" ]
COPY localrc ~/devstack
RUN [ "/usr/bin/env", "bash", "stack.sh" ]
