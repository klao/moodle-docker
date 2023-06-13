#!/bin/bash

set -euo pipefail

# Ensure that the necessary directories exist and are owned by the moodle user
# This will _not_ change the owner if it's wrong, but will at least fail in that case.
chown moodle:moodle /var/www/html /var/www/moodledata
chmod 755 /var/www/html /var/www/moodledata

cd /var/www/html

# Download Moodle
# Change the branch name to the version you want to install
# TODO: remove the depth=1
git clone --depth 1 -b MOODLE_401_STABLE git://git.moodle.org/moodle.git .

# Install Moodle
php admin/cli/install.php \
    --agree-license \
    --non-interactive \
    --chmod=750 \
    --lang=en \
    --wwwroot=http://localhost:$DEMOODLE_PORT \
    --dataroot=/var/www/moodledata \
    --dbtype=pgsql \
    --dbhost=$PHP_DB_HOST \
    --dbport=$PHP_DB_PORT \
    --dbname=$PHP_DB_NAME \
    --dbuser=$PHP_DB_USER \
    --dbpass=$PHP_DB_PASS \
    --fullname="My Demo Moodle" \
    --shortname="DeMoodle" \
    --adminemail=$DEMOODLE_EMAIL \
    --supportemail=$DEMOODLE_EMAIL \
    --adminpass=password

install-moodle-cron.sh
