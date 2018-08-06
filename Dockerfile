FROM nimmis/alpine-micro

MAINTAINER nimmis <kjell.havneskold@gmail.com>


RUN apk update && apk upgrade && \
    apk add python python-dev && \
    apk add --virtual=build-dependencies curl && \
    curl https://bootstrap.pypa.io/get-pip.py | python && \
	pip install -U pymysql==0.6.6 python-dateutil==2.4.2 feedparser==5.1.3 requests==2.7.0 && \
    apk del build-dependencies && \
    rm -Rf /root/.cache && \
    rm -rf /var/cache/apk/* && \
	adduser -D -h /home/container container

	
USER container
ENV  USER container
ENV  HOME /home/container

WORKDIR /home/container

COPY        ./entrypoint.sh /entrypoint.sh

CMD         ["/bin/ash", "/entrypoint.sh"]
