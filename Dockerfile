FROM phusion/baseimage:0.9.18
MAINTAINER Jim Tilander <jim@tilander.org>

CMD ["/sbin/my_init"]

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update
RUN apt-get install -yq --no-install-recommends -q wget python gettext-base python-pip python-passlib apache2-utils

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN pip install passlib --upgrade
RUN pip install -U pypiserver[cache] --upgrade

VOLUME /data
EXPOSE 80

ENV DEFAULT_USER=python
ENV DEFAULT_PASSWD=
ENV AUTO_UPDATE=0

RUN mkdir -p /data

RUN mkdir -p /etc/my_init.d
ADD init-pypi.sh /etc/my_init.d/pypi.sh

RUN mkdir -p /etc/service/pypi
ADD run-pypi.sh /etc/service/pypi/run

ADD *.sh /usr/local/bin/
RUN chmod a+x /usr/local/bin/*.sh

RUN echo "3 * * * * root bash -l -c /usr/local/bin/update-packages.sh" > /etc/cron.d/update-packages
