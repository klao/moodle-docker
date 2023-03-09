#!/bin/sh

set -e

sudo /usr/sbin/cron

exec apache2-foreground
