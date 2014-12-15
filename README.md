# docker-grafana

Docker image for grafana. Configured for InfluxDB.

Grafana is served with apache2.

Grafana queries are made like this: ```browser -> container (apache2 ProxyPass) -> influxdb```. This allows for easy container linking.

# Environment variables
- ```INFLUXDB_HOST```: InfluxDB hostname
- ```INFLUXDB_PORT```: InfluxDB port
- ```INFLUXDB_NAME```:  InfluxDB database name
- ```INFLUXDB_GRAFANADB```: InfluxDB database to use as as grafanadb
- ```INFLUXDB_USER```: InfluxDB username
- ```INFLUXDB_PASS```: InfluxDB password
