#!/bin/bash

# backup.sh — Incremental backup with rotation

set -euo pipefail

source_dir="$HOME/project02/source"
backup_dir="$HOME/project02/backups"
log_file="$HOME/project02/reports/backup.log"

timestamp=$(date +"%Y-%m-%d_%H-%M-%S")
backup_path="$backup_dir/backup_$timestamp"

MAX_BACKUPS=7

log() {
    echo "[$timestamp] $1" | tee -a "$log_file"
}

log "------------ Backup started -----------"

Disk_Usage=$(df "$backup_dir" | awk 'NR==2 {print $5}' | tr -d '%')

if [ "$Disk_Usage" -gt 90 ]; then
    log "WARNING: Disk usage is ${Disk_Usage}%."
fi

rsync -av \
      --progress \
      --exclude='*.tmp' \
      --exclude='*.swp' \
      "$source_dir/" \
      "$backup_path/" \
      >> "$log_file" 2>&1

log "Backup completed: $backup_path"

Backup_Count=$(find "$backup_dir" -maxdepth 1 -type d -name "backup_*" | wc -l)

if [ "$Backup_Count" -gt "$MAX_BACKUPS" ]; then
    Oldest=$(ls -dt "$backup_dir"/backup_* | tail -1)
    rm -rf "$OLDEST"
    log "Rotated old backup: $Oldest"
fi

TOTAL_BACKUPS=$(find "$backup_dir" -maxdepth 1 -type d -name "backup_*" | wc -l)

log "----- Backup finished. Total backups: $TOTAL_BACKUPS -----"
