#!/bin/bash

# Database configuration
DB_HOST='localhost'
DB_USER='username'
DB_PASS='password'
DB_NAME='database_name'

# Local backup directory and S3 bucket path
BACKUP_DIR='/path/to/backup/dir'
S3_BUCKET='s3/path/to/bucket'

# Generate a timestamp for the backup filename
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
BACKUP_FILE="$BACKUP_DIR/dbbackup_$TIMESTAMP.sql"
LOG_FILE="/path/to/$TIMESTAMP_logfile.log"

# Create a MySQL dump
if ! mysql -h $DB_HOST -u $DB_USER -p$DB_PASS $DB_NAME > $BACKUP_FILE; then
    echo "Error creating MySQL dump!" | tee -a "$LOG_FILE"
    exit 1
fi

# Upload the dump to S3
if ! aws s3 cp $BACKUP_FILE s3://$S3_BUCKET/dbbackup_$TIMESTAMP.sql; then
    echo "Error uploading to S3!" | tee -a "$LOG_FILE"
    exit 2
fi

# Verify the file exists on S3
if aws s3 ls s3://$S3_BUCKET/dbbackup_$TIMESTAMP.sql > /dev/null 2>&1; then
    echo "Backup successfully created at $BACKUP_FILE and uploaded to S3!"
else
    echo "Error: File not found on S3!" | tee -a "$LOG_FILE"
    exit 3
fi
