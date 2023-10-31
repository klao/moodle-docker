#!/bin/sh

set -e

sudo /usr/sbin/cron

exec php-fpm
