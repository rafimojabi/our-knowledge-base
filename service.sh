#!/bin/bash

# Define the path to the LocalSettings.php file
CONFIG_FILE="./mediawiki/LocalSettings.php"

# Check if the file exists
if [ -f "$CONFIG_FILE" ]; then
  echo "LocalSettings.php found, starting Docker Compose with volume mount."
  docker-compose -f docker-compose.yaml -f docker-compose.not-first-time.yaml up -d
else
  echo "LocalSettings.php not found, starting Docker Compose without volume mount."
  docker-compose -f docker-compose.yaml up -d
fi
