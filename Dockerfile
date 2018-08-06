# ----------------------------------
# Pterodactyl Core Dockerfile
# Environment: Python
# Minimum Panel Version: 0.6.0
# ----------------------------------
FROM ubuntu:16.04
ENV DEBIAN_FRONTEND noninteractive

MAINTAINER Firefox, <firebot1020@gmail.com>

RUN apt-get update \
    && apt-get install -y --no-install-recommends apt-utils\
    build-essential \
    ca-certificates \
	openssl \
    libpq-dev \
	libsqlite3-dev \
	sqlite3 \
	python2.7-mysqldb \
	python2.7-setuptools \
    python-pip \
    python2.7 \
    python2.7-dev \
    python-distribute \
    && apt-get autoremove \
    && apt-get clean

RUN pip install -U "pip"
RUN pip install -U "setuptools"
RUN pip install -U "pymysql==0.6.6"
RUN pip install -U "python-dateutil==2.4.2"
RUN pip install -U "feedparser==5.1.3"
RUN pip install -U "requests==2.7.0"
RUN pip install -U "paramiko==1.15.2"
RUN pip install -U "subprocess32==3.2.6"

RUN useradd -d /home/container -m container

USER container
ENV  USER container
ENV  HOME /home/container

WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh"]

ENTRYPOINT ["/usr/bin/python2.7"]



