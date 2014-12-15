# docker-grafana

Docker image for grafana. Configured for influxdb.

# Dependencies
- This container has to be linked with an influxdb container with the alias influxdb
- The influxdb database has ```db``` and ```grafana``` databases
- There is an influxdb user with username ```root``` and password ```root```

# Todo
- Make the influxdb username/password configurable
- Make the influxdb databases configurable
- Make the influxdb hostname configurable
