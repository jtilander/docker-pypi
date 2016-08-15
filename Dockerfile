FROM phusion/baseimage:0.9.18
MAINTAINER Jim Tilander <jim@tilander.org>

CMD ["/sbin/my_init"]

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update
RUN apt-get install -yq --no-install-recommends -q wget python gettext-base python-pip python-passlib apache2-utils

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN pip install passlib --upgrade
RUN pip install -U pypiserver --upgrade

VOLUME /data
EXPOSE 80

ENV DEFAULT_USER=python
ENV DEFAULT_PASSWD=

RUN mkdir -p /data

RUN mkdir -p /etc/my_init.d
ADD init-pypi.sh /etc/my_init.d/pypi.sh

RUN mkdir -p /etc/service/pypi
ADD run-pypi.sh /etc/service/pypi/run
