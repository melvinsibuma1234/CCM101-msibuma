# Backup Script Guide

## 1. Overview

This guide explains how to create and execute a Bash script that compresses application data into a timestamped backup file. It also documents how to schedule the backup using Linux Cron.

## 2. Create the Test Data

```bash
mkdir app-data
echo "This is critical client data." > app-data/data.txt
```

The `mkdir` command creates the application data directory. The `echo` command writes sample client data into `data.txt`.

## 3. Bash Backup Script

Create the script using:

```bash
nano backup.sh
```

Add the following code:

```bash
#!/bin/bash
# Automated Backup Script for CloudNova Technologies

SOURCE_DIR="app-data"
BACKUP_DIR="backups"
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")

echo "Initiating automated backup..."

# Create the backup directory if it does not exist
mkdir -p "$BACKUP_DIR"

# Compress the source directory into a tarball (.tar.gz)
tar -czf "$BACKUP_DIR/backup_$TIMESTAMP.tar.gz" "$SOURCE_DIR"

echo "Backup completed successfully at $TIMESTAMP!"
```

Save and exit Nano.

## 4. Make the Script Executable

```bash
chmod +x backup.sh
```

The `chmod +x` command adds execute permission to the script, allowing it to be run as a program.

## 5. Execute and Verify the Backup

```bash
./backup.sh
ls -l backups/
```

The script creates the backup directory if necessary and compresses the application data into a `.tar.gz` archive. The `ls -l` command displays the backup files and their details.

## 6. Configure the Cron Job

Open the current user's Cron table:

```bash
crontab -l
env EDITOR=nano crontab -e
```

Add the following line:

```cron
0 2 * * * /root/backup.sh
```

Save and exit Nano, then verify the schedule:

```bash
crontab -l
```

The Cron expression schedules the backup script to run every day at 2:00 AM, provided the script exists at `/root/backup.sh` and has the required permissions.

## 7. Cron Expression Breakdown

For the expression `0 2 * * * /root/backup.sh`:

| Field | Value | Meaning |
|---|---|---|
| Minute | `0` | At minute zero |
| Hour | `2` | At 2 AM |
| Day of Month | `*` | Every day of the month |
| Month | `*` | Every month |
| Day of Week | `*` | Every day of the week |

## 8. Important Considerations

The example uses relative paths for `app-data` and `backups`. The script should run from the directory containing `app-data`, or the paths should be changed to absolute paths. The Cron schedule must also point to the actual location of `backup.sh`.

A backup should be verified regularly, and important data should be stored in a separate location to protect against server failure.
