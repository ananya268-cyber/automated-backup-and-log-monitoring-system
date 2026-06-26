# Automated Backup and Log Monitoring System
This project demonstrates the implementation of an automated backup and log monitoring solution using Bash scripting, rsync, cron, and systemd on Ubuntu WSL.

**The system performs:**

- *Automated timestamped backups*
- *Backup rotation management*
- *Log analysis and anomaly detection*
- *Threshold-based alert generation*
- *Scheduled execution using cron*
- *Service management using systemd*

## Technologies Used
- Ubuntu WSL
- Bash Scripting
- rsync
- cron
- systemd
- mailutils

## Project Structure

<p align="center">
  <img src="screenshots/tree-structure.png" alt="Project Structure" width="400">
</p>

## Features

### Automated Backup System
- Creates timestamped backups
- Uses rsync for file synchronization
- Excludes temporary files
- Monitors disk usage
- Maintains only the latest seven backups

### Log Monitoring System
- Scans application logs
- Detects errors, failures, and critical events
- Generates daily reports
- Triggers alerts when thresholds are exceeded
- Supports optional email notifications

### Automation
- Daily backup execution using cron
- Hourly log monitoring using cron
- systemd service integration

## Validation Performed

- Manual script execution
<h3 align="center">backup.sh execution</h3>
<p align="center">
  <img src="screenshots/executable&rum-backup.sh.png" alt="backup-sh-script execution" width="600">
</p>

<h3 align="center">log_monitor.sh execution</h3>
<p align="center">
  <img src="screenshots/log-monitor.sh.png" alt="log_monitor.sh execution" width="600">
</p>

- Automatic cron execution
<p align="center">
  <img src="screenshots/cron-log.png" alt="cron-log" width="600">
</p>

- Backup creation verification
<p align="center">
  <img src="screenshots/backup-log-display.png" alt="backup-log-display" width="600">
</p>

- Alert generation verification
<p align="center">
  <img src="screenshots/alert-display.png" alt="when error is less than 5 no alert" width="600">
</p>

<p align="center">
  <img src="screenshots/error-morethan5.png" alt="when error more than 5" width="600">
</p>

## Limitations
Email alert delivery requires an SMTP relay or mail server configuration. The functionality was implemented and tested in Ubuntu WSL where external email delivery was not configured.

<h3 align="center">Implementation Evidence</h3>
The screenshot below demonstrates the successful implementation of the automated backup and log monitoring system. It highlights the organized project directory, timestamped backup snapshots, generated reports, and automation scripts.

<p align="center">
  <img src="screenshots/tree-end.png" alt="Implementation Evidence" width="400">
</p>

## Learning Outcomes
- Linux system administration
- Shell scripting
- File management and automation
- Log analysis
- Job scheduling with cron
- Service management with systemd
- Monitoring and alerting concepts
