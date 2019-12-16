FROM debian:buster

RUN apt-get update -yqq && apt-get install -yqq --no-install-recommends \
      gnupg2 \
      sshpass \
      python-setuptools \
      python-crypto \
      python-yaml \
      python-jinja2 \
      python-paramiko \
      python-httplib2 \
      python-six

RUN echo 'deb http://ppa.launchpad.net/ansible/ansible/ubuntu trusty main' > /etc/apt/sources.list && \ 
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367 && \
    apt-get update -yqq
RUN apt-get install -y ansible

CMD ["ansible", "--version"]
