*This project has been created as part of the 42 curriculum by lhagemos.*

# User Documentation — Inception

## Overview

This project runs a small web infrastructure using Docker. It provides:

- A **WordPress website** (main user-facing service)
- A **MariaDB database** (stores WordPress data)
- An **NGINX web server** (handles HTTPS connections)

All services run in isolated containers and communicate through a Docker network.

---

## Start & Stop the Project

### Start
Run the following command in the root directory:

```bash
make up
```
Starts all services in detached mode. Docker images are built only if they don’t already exist.

### Stop
To stop all running containers:
```bash
make down
```

Full cleanup (optional)
```bash
make fclean
```
This removes containers, images, and volumes.

---

## Access

### Website

Once the stack is running, open your browser:
https://lhagemos.42.de
⚠️ You may see a security warning because of the self-signed SSL certificate. This is expected.

### Administration Panel

WordPress admin panel is available at:
https://lhagemos.42.de/wp-admin

Log in using credentials defined in:

.env (configuration values)
secrets/ (password files)

---

## Credentials Management

Credentials are split into:

- .env → configuration values (database name, usernames, emails)
- secrets/ → password files used by containers

Secrets include:

- Database user and root password
- WordPress admin password
- WordPress user password

⚠️ These files must never be exposed publicly.

---

## Checking if Services are Running

Run:
```bash
docker ps
```

You should see containers such as:

-nginx
-wordpress
-mariadb

If a container is missing, check logs:
```bash
docker logs <container_name>
```