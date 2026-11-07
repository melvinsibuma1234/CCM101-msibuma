#!/bin/bash
# CloudNova - PostgreSQL backup with 7-day rotation
set -euo pipefail

BACKUP_DIR="/opt/backups"
LOG="/var/log/cn_backup.log"
STAMP=$(date +%F_%H-%M-%S)
FILE="$BACKUP_DIR/cloudnova_db_$STAMP.sql.gz"

mkdir -p "$BACKUP_DIR"

if docker exec cn_postgres sh -c 'pg_dump -U "$POSTGRES_USER" "$POSTGRES_DB"' | gzip > "$FILE"; then
  echo "[$(date)] OK: $FILE" >> "$LOG"
else
  echo "[$(date)] FAILED backup" >> "$LOG"
  exit 1
fi

find "$BACKUP_DIR" -name "*.sql.gz" -mtime +7 -delete
