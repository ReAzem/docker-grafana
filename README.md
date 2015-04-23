# docker-grafana

Docker image for grafana 2.0+. Configured for InfluxDB.

Data Sources are pre-created in Grafana.

For example, with docker-compose:
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
    INFLUXDB_USER: "root"
    INFLUXDB_PASS: "root"
```

# Environment variables
- ```INFLUXDB_HOST```: InfluxDB hostname
- ```INFLUXDB_PORT```: InfluxDB port
- ```INFLUXDB_NAME```:  InfluxDB database name
- ```INFLUXDB_USER```: InfluxDB username
- ```INFLUXDB_PASS```: InfluxDB password
