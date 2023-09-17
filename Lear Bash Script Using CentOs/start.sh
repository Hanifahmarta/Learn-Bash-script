#!/bin/bash
# Start PostgreSQL
echo "Starting PostgreSQL..."
systemctl start postgresql
# Start Nginx
echo "Starting Nginx..."
systemctl start nginx
# Start Express Server
echo "Starting Express Server..."
cd /opt/oss/src/
node app.js