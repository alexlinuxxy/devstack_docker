FROM alexlinuxxy/ubuntu_dev_docker
MAINTAINER Alex Huang "nikshuang@163.com"
ENV REFRESHED_AT 2016-6-19

RUN useradd -m stack
RUN echo "stack:stack" | chpasswd
RUN chmod +w /etc/sudoers
RUN sed -i '/^root/astack	ALL=(ALL:ALL) NOPASSWD:NOPASSWD:ALL' /etc/sudoers
RUN chmod -w /etc/sudoers

ENV TOP_DIR /home/stack

WORKDIR $TOP_DIR
USER stack

RUN git clone git://github.com/openstack-dev/devstack.git
COPY localrc $TOP_DIR/devstack
WORKDIR devstack
RUN export TERM=xterm
RUN lsmod | grep nat
RUN lsmod | grep iptable
RUN modprobe ip_tables
RUN modprobe ip_conntrack
RUN modprobe iptable_filter
RUN modprobe ipt_state
RUN [ "/usr/bin/env", "bash", "openrc", "admin" ]
RUN [ "/usr/bin/env", "bash", "stack.sh" ]
