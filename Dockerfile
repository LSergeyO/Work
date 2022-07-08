FROM centos:7
RUN yum -y install wget \
    && yum -y install epel-release \
    && yum -y install ansible git python3-pip \
    && yum -y install mc \
    && yum -y install vim \
    && ansible-galaxy install Juniper.junos
