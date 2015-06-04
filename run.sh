#!/bin/bash

cd grafana-${GRAFANA_VERSION}

function setup_grafana {
    sed -i "s|<-- GRAFANA_ROOT_URL -->|${GRAFANA_ROOT_URL}|" /grafana.ini
    sed -i "s|<-- GRAFANA_AUTH_PROXY_ENABLED -->|${GRAFANA_AUTH_PROXY_ENABLED}|" /grafana.ini
    sed -i "s|<-- GRAFANA_AUTH_PROXY_HEADER_NAME -->|${GRAFANA_AUTH_PROXY_HEADER_NAME}|" /grafana.ini

    echo -e "Grafana configured."
}

setup_grafana

./bin/grafana-server -config="/grafana.ini"

