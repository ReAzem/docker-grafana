#!/bin/bash

cd grafana-${GRAFANA_VERSION}
./bin/grafana-server -config="/grafana.ini"
