define(['settings'],
function (Settings) {
  return new Settings({
    datasources: {
      influx: {
        default: true,
        grafanaDB: true,
        type: 'influxdb',
        url: "/influxdb/db/db",
        username: "root",
        password: "root",
      }
    },
    default_route: '/dashboard/file/default.json',
    timezoneOffset: null,
    grafana_index: "grafana-dash",
    unsaved_changes_warning: true,
    panel_names: ['text','graphite']
  });
});
