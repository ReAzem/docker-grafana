#!/bin/bash

if [ -f /.configured ]; then
    echo "=> Grafana was already configured"
else
    touch /.configured

    # Configure the ProxyPass
    sed -i -e "s/<--ADDR-->/${INFLUXDB_HOST}/g" \
        -e "s/<--PORT-->/${INFLUXDB_PORT}/g" /etc/apache2/conf-enabled/influxdb.conf

    # Configure grafana
    sed -i -e "s/<--GRAFANADB-->/${INFLUXDB_GRAFANADB}/g" \
        -e "s/<--DB_NAME-->/${INFLUXDB_NAME}/g" \
        -e "s/<--USER-->/${INFLUXDB_USER}/g" \
        -e "s/<--PASS-->/${INFLUXDB_PASS}/g" /var/www/html/grafana/config.js

    # Echo the config
    echo "=> Grafana was configured as follows:"
    echo "   InfluxDB ADDRESS:  ${INFLUXDB_HOST}"
    echo "   InfluxDB PORT:     ${INFLUXDB_PORT}"
    echo "   InfluxDB DB NAME:  ${INFLUXDB_NAME}"
    echo "   InfluxDB USERNAME: ${INFLUXDB_USER}"
    echo "   InfluxDB PASSWORD: ${INFLUXDB_PASS}"
    echo "   InfluxDB GRAFANADB:${INFLUXDB_GRAFANADB}"
fi

source /etc/apache2/envvars
chown www-data:www-data /var/www -R
exec apache2ctl -DFOREGROUND
