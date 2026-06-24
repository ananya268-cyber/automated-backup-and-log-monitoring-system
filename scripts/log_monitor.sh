#!/bin/bash

# log_monitor.sh — Scan logs and alert on anomalies

set -euo pipefail

Log_Dir="$HOME/project02/source/logs"
Report_File="$HOME/project02/reports/alerts_$(date +%Y-%m-%d).txt"

Error_Threshold=5
alert_email="ananya070326@gmail.com"

echo "----- Log Monitor Report: $(date) -----" > "$Report_File"

for logfile in "$Log_Dir"/*.log
do
    BASENAME=$(basename "$logfile")

    Error_Count=$(grep -ic 'error\|failed\|critical' "$logfile" 2>/dev/null || echo 0)
    Warn_Count=$(grep -ic 'warn\|warning' "$logfile" 2>/dev/null || echo 0)

    echo "" >> "$Report_File"
    echo "File: $BASENAME" >> "$Report_File"
    echo "  Errors/Failures : $Error_Count" >> "$Report_File"
    echo "  Warnings        : $Warn_Count" >> "$Report_File"

    if [ "$Error_Count" -gt "$Error_Threshold" ]; then
        echo "  STATUS: ALERT - Errors exceed threshold ($Error_Threshold)" >> "$Report_File"

        logger -t log_monitor "ALERT: $BASENAME has $Error_Count errors"
        echo "Alert: $Error_Count errors in $BASENAME" | mail -s "Log Alert" "$alert_email"
    else
        echo "  STATUS: OK" >> "$Report_File"
    fi
done

echo "" >> "$Report_File"
echo "Report saved: $Report_File"
