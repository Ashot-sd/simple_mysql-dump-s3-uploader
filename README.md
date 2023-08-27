# MySQL to S3 Backup Script

This repository contains a simple Bash script that performs a backup of a MySQL database and uploads the backup to an AWS S3 bucket.

## Features

- **Efficient and Fast**: Quickly backup your MySQL database and ensure its safety on AWS S3.
- **Simple Configuration**: Just adjust a few parameters, and you're good to go.
- **Log Support**: Log errors to a separate file for easier troubleshooting.

## Prerequisites

- AWS CLI installed and configured with the necessary permissions to upload to your intended S3 bucket.
- `mysqldump` and `mysql` utilities available in the path.
- (Optional) `zip` utility if you want to store your backups as zipped files.

## Usage

1. **Clone this repository**:
```bash
git clone [repository-url]
cd [repository-dir]
```
2. **Edit the configuration section in the mysql_dump.sh script with your database and S3 details.**
3. **Grant execute permissions to the script:**
```bash
chmod +x mysql_dump.sh
```
4.**Run the script:**
```bash
./mysql_dump.sh
```

## Automate with Cron

You can also schedule the script to run automatically using cron. Here's an example that runs the script every day at 2 AM:
```bash
0 2 * * * /path/to/script/mysql_dump.sh
```


