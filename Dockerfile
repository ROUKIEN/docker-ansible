FROM debian:buster

RUN apt-get update -yqq && apt-get install -yqq --no-install-recommends \
      openssh-client \
      gnupg2 \
      sshpass \
      python-setuptools \
      python-crypto \
      python-yaml \
      python-jinja2 \
      python-paramiko \
      python-httplib2 \
      python-six \
      && \
      echo 'deb http://ppa.launchpad.net/ansible/ansible/ubuntu trusty main' > /etc/apt/sources.list \
      && \ 
      apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367 \
      && \
      apt-get update -yqq \
      && \
      apt-get install -y ansible

RUN groupadd --gid 1000 ansible-control-node && useradd --uid 1000 --gid ansible-control-node --create-home --shell /bin/sh ansible-control-node

USER ansible-control-node

WORKDIR /home/ansible-control-node

RUN mkdir /home/ansible-control-node/.ssh

CMD ["ansible", "--version"]
