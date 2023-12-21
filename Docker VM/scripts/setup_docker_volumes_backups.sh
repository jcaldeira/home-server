#!/bin/bash

# sudo chmod u+x ./setup_docker_volumes_backups.sh
# Meant to be run as root

# Create backups folder
mkdir -p /mnt/backups/docker_volumes

# Mount TrueNAS NFS share
echo "truenas.home:/mnt/bpool/backups/docker_volumes /mnt/backups/docker_volumes nfs4 defaults 0 0" >> /etc/fstab
mount -a

# Create folders
mkdir -p /opt/scripts

# Create log folder
mkdir -p /var/log/backup_docker_volumes

# Create backup_docker_volumes.sh file
touch /opt/scripts/backup_docker_volumes.sh
chmod u+x /opt/scripts/backup_docker_volumes.sh
