#!/bin/bash

set -euo pipefail

# Setup cron by using crontab to run the cron.php script every minute
crontab - <<'EOF'
PATH=/usr/local/bin:/usr/bin:/bin

* * * * * php /var/www/html/admin/cli/cron.php > /var/www/moodledata/cronlog.log 2>&1
EOF
