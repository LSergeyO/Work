FROM centos:7

RUN yum -y install wget \
    && yum -y install epel-release \
    && yum -y install ansible \
    && ansible-galaxy install Juniper.junos