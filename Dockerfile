FROM debian:jessie
MAINTAINER Alexandre Viau <alexandre@alexandreviau.net>

ENV GRAFANA_VERSION 2.0.2

RUN apt-get update && \
    apt-get install -y wget curl && \
    wget https://grafanarel.s3.amazonaws.com/builds/grafana-${GRAFANA_VERSION}.linux-x64.tar.gz -O grafana.tar.gz && \
    tar zxf grafana.tar.gz

ADD /grafana.ini grafana.ini

ENV INFLUXDB_HOST influxdb
ENV INFLUXDB_PORT 8086
ENV INFLUXDB_NAME db
ENV INFLUXDB_USER root
ENV INFLUXDB_PASS root

ADD run.sh /run.sh
RUN chmod +x /*.sh

CMD ["/run.sh"]
