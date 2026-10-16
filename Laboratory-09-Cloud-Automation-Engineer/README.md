# Laboratory 09: The Cloud Automation Engineer

## Mission Overview

This laboratory activity demonstrates how Bash scripting and Linux Cron can automate repetitive cloud administration tasks. A sample application directory is created, backed up using a Bash script, and scheduled to run automatically every day at 2:00 AM.

## Objectives

- Understand Bash scripting syntax and variables.
- Create and edit scripts using Nano.
- Modify file permissions using `chmod`.
- Compress application data into a `.tar.gz` archive.
- Configure a scheduled task using Linux Cron.
- Document automation procedures using Markdown.
- Complete the ninth mission in the GitHub Cloud Computing Portfolio.

## Commands Executed

### Create Sample Application Data

```bash
mkdir app-data
echo "This is critical client data." > app-data/data.txt
```

### Create and Execute the Backup Script

```bash
nano backup.sh
chmod +x backup.sh
./backup.sh
ls -l backups/
```

### Configure the Cron Schedule

```bash
crontab -l
env EDITOR=nano crontab -e
crontab -l
```

Cron schedule:

```cron
0 2 * * * /root/backup.sh
```

## Skills Learned

- Writing Bash shell scripts.
- Using variables and timestamps in automation.
- Creating compressed backup archives.
- Managing Linux file permissions.
- Scheduling recurring tasks with Cron.
- Verifying script output and scheduled configurations.
- Writing technical documentation in Markdown.
- Maintaining a cloud computing portfolio on GitHub.

## Screenshots

- `screenshots/script-execution.png` — Successful script execution and generated backup archive.
- `screenshots/cron-schedule.png` — Installed Cron schedule displayed in the terminal.
