# README

## Service Management Script for Docker Compose Setup

This repository contains a script to manage Docker Compose services for a MediaWiki setup. The script simplifies the process of starting, reloading, restarting, and stopping the services, ensuring a smooth and automated workflow.

### Directory Structure

- **docker-compose/**
  - **wiki/**: Directory where `LocalSettings.php` should be placed after the initial setup.
  - **init/**: Contains SQL queries or scripts required to initialize the databases for the services.

### Script Usage

The management script, `service.sh`, provides commands to start, reload, restart, and stop the Docker Compose services. 

### Commands

- `start`: Initializes and starts the Docker Compose services. After the initial setup, ensure that `LocalSettings.php` is downloaded and placed in the `docker-compose/wiki/` directory. This command will be used for the first-time setup.
- `reload`: Reloads the Docker Compose services. Use this command after placing `LocalSettings.php` in the `docker-compose/wiki/` directory to apply the configuration.
- `restart`: Restarts all the Docker Compose services. Useful for applying any changes or updates.
- `stop`: Stops the Docker Compose services. Use this to stop the running containers.

### How to Run

1. **Ensure the script is executable**: 
   ```bash
   chmod +x service.sh
2. **Run the script with desired arguments**:
    ```bash
    bash service.sh [command]

Replace [command] with one of the supported arguments: start, reload, restart, or stop.

### Detailed Steps
1. **start the service**
   ```bash
   bash service.sh start
This command will initialize and start the services using Docker Compose. It’s the initial setup command. After running this, ensure to download and place the LocalSettings.php file in the docker-compose/wiki/ directory.

2. **reload the service**
   ```bash
     bash service.sh reload
Once `LocalSettings.php` is in the correct location, use this command to reload the services and apply the new configuration.

3. **Restart the service**
   ```bash
     bash service.sh restart
This command stops and then starts all the services, useful for applying updates or changes.

4. **Stop the service**
   ```bash
     bash service.sh stop
This command will stop all running Docker Compose services.

# Example Workflow

## Initial Setup:

1. Run `bash service.sh start` to start the services.
2. Setup wiki and Download `LocalSettings.php` and place it in the `docker-compose/wiki/` directory.
3. Run `bash service.sh reload` to apply the configuration.

## Managing Services:

1. Use `bash service.sh stop` to stop the services when not needed.
2. Use `bash service.sh restart` to apply changes or updates.

## Directory Overview

- **docker-compose/wiki/**: After the initial setup, `LocalSettings.php` should be placed here.
- **docker-compose/init/**: Contains SQL scripts to initialize databases required by the services.

## Accessing to the Application
The default domains set for the applications are as follows:
- **mediawiki**: [http://wiki.live-in-europe.org](http://wiki.live-in-europe.org)
- **flarum**: [http://flarum.live-in-europe.org](http://flarum.live-in-europe.org)

These URLs are set for test purposes. In order to change the domains, Nginx config file at `nginx/conf/app.conf` should be updated correspondingly.

### NOTE:
 `docker compose restart webserver` is required after applying new configurations.
 
## Accessing the Applications

- **MediaWiki**: Access the application at [http://127.0.0.1:1234](http://127.0.0.1:1234)
- **Flarum**: Access the application at [http://127.0.0.1:5678](http://127.0.0.1:5678)

## Database Configuration for application installation
- **host**: *database*
- **user**: *adminuser*
- **password**: *123456*

## Important Notes

- Ensure that the `LocalSettings.php` file is correctly downloaded and placed in the `docker-compose/wiki/` directory after the initial start.
- The script simplifies managing Docker Compose services but assumes that the Docker and Docker Compose environments are correctly set up on your system.
- **Production Consideration**: It is important to remove port mappings (`1234:80`, `5678:80`, etc.) from the Docker Compose configuration before deploying to production to avoid exposing internal services to the public.

For any issues or contributions, please refer to the [issues](https://github.com/rafimojabi/our-knowledge-base) page or submit a pull request.

For more details and advanced configurations, refer to the official Docker and Docker Compose documentation.


## Sources
- https://hub.docker.com/_/mediawiki
- https://hub.docker.com/r/shinsenter/flarum