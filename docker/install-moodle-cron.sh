#!/bin/bash

set -euo pipefail

# Setup cron by using crontab to run the cron.php script every minute
crontab - <<'EOF'
PATH=/usr/local/bin:/usr/bin:/bin

* * * * * php /var/www/html/admin/cli/cron.php > /dev/null 2>&1
* * * * * php /var/www/html/admin/cli/adhoc_task.php --execute --keep-alive=59 > /dev/null 2>&1
* * * * * php /var/www/html/admin/cli/adhoc_task.php --execute --keep-alive=59 > /dev/null 2>&1
EOF
