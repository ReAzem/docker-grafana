#!/bin/bash
source /etc/apache2/envvars
chown www-data:www-data /var/www -R
exec apache2ctl -DFOREGROUND
