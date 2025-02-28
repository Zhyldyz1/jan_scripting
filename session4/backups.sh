#!/bin/bash 

BACKUP_SERVER="157.230.187.177"
USER="root"
PASSWORD="hwPi7jFEnS9L85j"
SOURCE_DIR=$1
DEST_DIR=$2
TEMP_DIR="/tmp/backups"
LOG_DEST="/var/log/backups.log"


_checkDirectory() {
    if ! [ -d $SOURCE_DIR ]; then
        echo "Source dir [$SOURCE_DIR] does not exits"
        echo "Please provide correct input"
        exit
    fi
}

_copyFiles() {
    mkdir $TEMP_DIR
    files=$(find $SOURCE_DIR -type f -name "*.sh")
    for file in $files; do
        cp $file $TEMP_DIR
        ls $file
    done 
}

_compress_backup() {
    TIME_STAMP=$(date +%Y-%m-%d-%S)
    tar -czf "/tmp/script-backups-$TIME_STAMP.tar.gz" $TEMP_DIR
}

_logBackups() {
    echo "Backup completed at $TIME_STAMP from $SOURCE_DIR to $DEST_DIR IN $BACKUP_SERVER" >> $LOG_DEST
}

_copyBackupToRemote() {
    scp "/tmp/script-backups-$TIME_STAMP.tar.gz" $USER@$BACKUP_SERVER:$DEST_DIR
    rm -rf $TEMP_DIR /tmp/script-backups-$TIME_STAMP.tar.gz
}

_checkDirectory
_copyFiles
_compress_backup
_logBackups
_copyBackupToRemote