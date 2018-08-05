# ----------------------------------
# Pterodactyl Core Dockerfile
# Environment: Python
# Minimum Panel Version: 0.6.0
# ----------------------------------
FROM debian:jessie

MAINTAINER Firefox, <firebot1020@gmail.com>

RUN apt update \
    && apt -y --no-install-recommends install curl ca-certificates openssl libsqlite3-dev sqlite3 build-essential python-mysqldb python python-dev python-distribute python-pip postgresql-common libpq-dev python-setuptools \
    && pip install pymysql==0.6.6 python-dateutil==2.4.2 feedparser==5.1.3 requests==2.7.0 paramiko==1.15.2 subprocess32==3.2.6 \
    && useradd -d /home/container -m container

USER container
ENV  USER container
ENV  HOME /home/container

WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh

CMD ["/bin/ash", "/entrypoint.sh"]
