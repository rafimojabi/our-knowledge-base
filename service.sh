#!/bin/bash

# Define the path to the LocalSettings.php file
CONFIG_FILE="./docker-compose/mediawiki/LocalSettings.php"

# Function to start Docker Compose services
start_services() {
  if [ -f "$CONFIG_FILE" ]; then
    echo "LocalSettings.php found, starting Docker Compose with volume mount."
    docker-compose -f ./docker-compose/docker-compose.yaml -f ./docker-compose/docker-compose.not-first-time.yaml up -d
  else
    echo "LocalSettings.php not found, starting Docker Compose without volume mount."
    docker-compose -f ./docker-compose/docker-compose.yaml up -d
  fi
}

# Function to stop Docker Compose services
stop_services() {
  echo "Stopping Docker Compose services."
  docker-compose -f ./docker-compose/docker-compose.yaml down
}

# Function to restart Docker Compose services
restart_services() {
  echo "Restarting Docker Compose services."
  docker-compose -f ./docker-compose/docker-compose.yaml down
  start_services
}

# Function to reload Docker Compose services
reload_services() {
  start_services
}

# Check the argument provided to the script
case "$1" in
  start)
    start_services
    ;;
  stop)
    stop_services
    ;;
  restart)
    restart_services
    ;;
  reload)
    reload_services
    ;;
  *)
    echo "Usage: $0 {start|stop|restart|reload}"
    exit 1
    ;;
esac
