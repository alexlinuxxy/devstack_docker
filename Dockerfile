FROM ubuntu:16.04
MAINTAINER Alex Huang "nikshuang@163.com"
ENV REFRESHED_AT 2016-6-19

RUN apt-get update
RUN apt-get install git sudo -y

RUN useradd -m stack
RUN echo "stack:stack" | chpasswd
RUN echo "stack	ALL=(ALL:ALL) NOPASSWD:NOPASSWD:ALL" >>/etc/sudoers
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
RUN [ "/usr/bin/env", "bash", "openrc", "admin" ]
RUN [ "/usr/bin/env", "bash", "stack.sh" ]
