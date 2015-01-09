# docker-grafana

Docker image for grafana. Configured for InfluxDB.

Grafana is served with apache2.

Grafana queries are made like this: ```browser -> container (apache2 ProxyPass) -> influxdb```. This allows for easy container linking.

For example, with fig:
```yaml
influxdb:
  image: tutum/influxdb
  environment:
    PRE_CREATE_DB: "db;grafana"

grafana:
  image: savoirfairelinux/grafana
  ports:
    - "80:80"
  links:
    - influxdb
  environment:
    INFLUXDB_HOST: "influxdb"
    INFLUXDB_PORT: "8086"
    INFLUXDB_NAME: "db"
    INFLUXDB_GRAFANADB: "grafana"
    INFLUXDB_USER: "root"
    INFLUXDB_PASS: "root"
```

# Environment variables
- ```INFLUXDB_HOST```: InfluxDB hostname
- ```INFLUXDB_PORT```: InfluxDB port
- ```INFLUXDB_NAME```:  InfluxDB database name
- ```INFLUXDB_GRAFANADB```: InfluxDB database to use as as grafanadb
- ```INFLUXDB_USER```: InfluxDB username
- ```INFLUXDB_PASS```: InfluxDB password
