#!/bin/bash
# Backup PostgreSQL database to .sql file
pg_dumpall -U postgres -d test > /opt/oss/data/backups/db_backup_$(date 
+%Y%m%d%H%M%S).sql