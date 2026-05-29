*This project has been created as part of the 42 curriculum by lhagemos.*


# Developer Documentation — Inception

## Environment Setup

### Prerequisites

Before starting, ensure the following are installed on your system:

- Docker
- Docker Compose
- Make
- Linux-based system (recommended)


### Project Configuration

The project already includes the following configuration files:

docker-compose.yml for container orchestration
- Makefile for simplified project commands
- Configuration files for:
- NGINX
- WordPress
- MariaDB

However, you still need to configure:

- Environment variables (.env)
- Secrets for passwords
- Host Redirection
- Adjust storage path for the volumes in docker-compose.yml to your host file system

#### Environment

Create a .env file inside the srcs/ directory.

The file must contain the following variables:

- DOMAIN_NAME
*Must match the server_name defined in the NGINX configuration.*
- LOGIN
*Must match the value of the USER environment variable on the host system*
- CRED_CERT
*Path to the self-signed TLS certificate used by NGINX (see nginx configuration file).*
- CRED_KEY
*Path to the TLS certificate key (see nginx configuration file).*
- WP_TITLE
- WP_ADMIN
- WP_ADMIN_EMAIL
- WP_USER
- WP_USER_EMAIL
- DB_NAME
- DB_USER

#### Secrets

Create a secrets/ directory at the root of the repository containing the following files:

- admin_password.txt
- db_password.txt
- wpuser_password.txt
- db_root_password.txt

The content of these files can be chosen freely and will be used as passwords by the containers.

#### Host Redirection

To access the website locally through the configured domain name, add an entry to your /etc/hosts file.

Check your local IP address:
```bash
ip address
```
Open the /etc/hosts file with a text editor:
```bash
sudo vim /etc/hosts
```
Add the following line to the file:

<IP_ADDRESS> <DOMAIN_NAME>

Example:

127.0.0.1 login.42.de

Save the file after editing.

---

## Build & Launch

### Build (if not build yet) and start all services
```bash
make up
```

This will:

Build Docker images only if they don't already exist.
Create a network
Start containers (NGINX, WordPress, MariaDB)

### Stop services
```bash
make down
```
Rebuild images and restart:
```bash
make re
```
Full cleanup:

To fully reset the environment:
```bash
make fclean
```
This removes:
- Containers
- Images
- Volumes


### Docker Compose Usage (manual alternative)

Start:
```bash
docker compose up --build
```
Stop:
```bash
docker compose down
```
---

## Management of containers and volumes

### Container Management

List running containers:
```bash
docker ps
```

View logs:
```bash
docker logs <container>
```

Enter a container:
```bash
docker exec -it <container> bash
```
Enter a container using make file:
```bash
make nginx
make wp
make mdb
```

### Volume Management

List all volumes:
```bash
docker volume ls
```

Remove a volume:
```bash
docker volume rm VOLUME_NAME
```
In this project local volumes were used therefore this only removes the Docker volume metadata/reference it does not delete the actual host directory. You must manually remove the directory.

Shows mount path, driver, labels, etc.:
```bash
docker volume inspect my_volume
```
---

## Data Persistence and Location

This project uses Docker named volumes to persist data for WordPress and MariaDB.

Two named volumes are defined:

- db_data for MariaDB database files
- wp_data for WordPress files

The volumes are configured to store their data inside /home/<login>/data on the host system.
This ensures that data persists across container restarts, rebuilds, and removals, while still being managed by Docker as named volumes.
They would only be removed through manual deletion of the host directory.
