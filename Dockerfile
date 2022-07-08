FROM centos:7
RUN yum -y install wget \
    && yum -y install epel-release \
    && yum -y install ansible git python-pip\
    && ansible-galaxy install Juniper.junos
