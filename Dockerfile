FROM ubuntu:20.04

RUN DEBIAN_FRONTEND=noninteractive apt-get update && \
    apt-get install -y gnupg2 python3-pip sshpass vim mc git openssh-client && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get clean
    
RUN python3 -m pip install --upgrade pip cffi && \
    pip install ansible==2.9.27 && \
    pip install mitogen==0.2.10 ansible-lint==5.4.0 jmespath && \
    pip install --upgrade pywinrm && \
    ansible-galaxy install Juniper.junos && \
    ansible-galaxy collection install junipernetworks.junos && \
    rm -rf /root/.cache/pip

RUN mkdir /ansible && \
    mkdir -p /etc/ansible && \
    echo 'localhost' > /etc/ansible/hosts

WORKDIR /ansible

CMD [ "ansible-playbook", "--version" ]
