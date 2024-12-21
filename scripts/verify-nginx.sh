#!/bin/bash

DATA_HORA=$(date '+%Y-%m-%d %H:%M:%S')

LOG_DIR="/var/log/nginx_status"
mkdir -p $LOG_DIR

ONLINE_LOG="$LOG_DIR/nginx_online.log"
OFFLINE_LOG="$LOG_DIR/nginx_offline.log"

STATUS=$(systemctl is-active nginx)

if [ "$STATUS" = "active" ]; then
    echo "[$DATA_HORA] [Nginx] [$STATUS] [INFO] - O server está ONLINE" >> $ONLINE_LOG
else
    echo "[$DATA_HORA] [Nginx] [$STATUS] [ERROR] - O server está OFFLINE" >> $OFFLINE_LOG
fi