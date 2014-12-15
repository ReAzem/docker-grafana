FROM debian:jessie
MAINTAINER Alexandre Viau <alexandre@alexandreviau.net>

ENV GRAFANA_VERSION 1.9.0

RUN apt-get update && \
    apt-get install -y wget libapache2-mod-proxy-html apache2 && \
    a2enmod proxy_http && \
    wget http://grafanarel.s3.amazonaws.com/grafana-${GRAFANA_VERSION}.tar.gz -O grafana.tar.gz && \
    tar zxf grafana.tar.gz && \
    rm grafana.tar.gz && \
    mv grafana-${GRAFANA_VERSION} /var/www/html/grafana && \
    apt-get autoremove -y wget && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

ADD grafana.conf /etc/apache2/sites-available/grafana.conf
ADD config.js /var/www/html/grafana/config.js

ADD run.sh /run.sh
RUN chmod +x /*.sh

CMD ["/run.sh"]
