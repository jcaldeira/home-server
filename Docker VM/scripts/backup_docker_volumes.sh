#!/bin/bash

# sudo chmod u+x /opt/scripts/backup_docker_volumes.sh
# sudo crontab -u root -e
# 0 4 * * * /opt/scripts/backup_docker_volumes.sh > /var/log/backup_docker_volumes/$(date +"\%Y-\%m-\%d_\%H-\%M").log 2>&1

# Get running containers
echo "Getting running containers..."
running_containers=$(docker container list --quiet)

# Stop running containers
echo "Stoping running containers..."
docker stop $running_containers

# Backup all local volumes from /mnt/docker_volumes
echo "Backing up all volumes mounted at '/mnt/docker_volumes'"
tar -cvf /mnt/backups/docker_volumes/$(date +"%Y-%m-%d_%H-%M").tar /mnt/docker_volumes/

# Start previous running containers
echo "Starting previous running containers..."
docker start $running_containers

echo "All done!"
