#!/bin/bash
chown www-data:www-data /var/www -R
exec apache2ctl -e debug -DFOREGROUND >> /var/log/apache.log 2>&1
