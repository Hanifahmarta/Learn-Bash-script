#!/bin/bash
# Stop PostgreSQL
systemctl stop postgresql
# Stop Express server
pkill -f "node /opt/oss/src"
# Stop Nginx
systemctl stop nginx