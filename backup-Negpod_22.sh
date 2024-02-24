#!/bin/bash

# Remote server details
REMOTE_USER="remote_user"
REMOTE_HOST="remote_host"
REMOTE_DIR="/path/to/backup/directory"

# Directory to be backed up
LOCAL_DIR="negpod_id-q1"

# Perform backup
rsync -avz --delete $LOCAL_DIR $REMOTE_USER@$REMOTE_HOST:$REMOTE_DIR

# Check if rsync was successful
if [ $? -eq 0 ]; then
    echo "Backup successful."
else
    echo "Backup failed. Please check the logs."
fi

