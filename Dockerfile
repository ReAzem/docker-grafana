FROM tutum/nginx
MAINTAINER Feng Honglin <hfeng@tutum.co>

ENV GRAFANA_VERSION 1.9.0

RUN apt-get update && \
    apt-get install -y wget apache2-utils && \
    wget http://grafanarel.s3.amazonaws.com/grafana-${GRAFANA_VERSION}.tar.gz -O grafana.tar.gz && \
    tar zxf grafana.tar.gz && \
    rm grafana.tar.gz && \
    rm -rf app && \
    mv grafana-${GRAFANA_VERSION} app && \
    apt-get autoremove -y wget && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

ADD config.js /app/config.js
ADD default /etc/nginx/sites-enabled/default

ADD run.sh /run.sh
RUN chmod +x /*.sh

CMD ["/run.sh"]
