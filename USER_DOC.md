# User Documentation — Inception

*This project has been created as part of the 42 curriculum by lhagemos.*

---

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

```bash id="u_start"
make
```
This will build and start all services.

Stop
To stop all running containers:
make down

Full cleanup (optional)
make clean
This removes containers, images, and volumes.

Accessing the Website

Once the stack is running, open your browser:
https://localhost
⚠️ You may see a security warning because of the self-signed SSL certificate. This is expected.

Administration Panel

WordPress admin panel is available at:
https://localhost/wp-admin
Log in using the admin credentials defined in your environment configuration.

Credentials Management

All credentials are stored in environment configuration files (not inside containers).

Typical locations:

.env
secrets/ (if used in your setup)

They may include:

Database user/password
WordPress admin user/password
Database root password

⚠️ Never expose these files publicly.

Checking if Services are Running

Run:
docker ps
You should see containers such as:

nginx
wordpress
mariadb

If a container is missing, check logs:
docker logs <container_name>