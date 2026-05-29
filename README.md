*This project has been created as part of the 42 curriculum by lhagemos.*

# Inception

## Description

This project is part of the 42 curriculum and aims to introduce system administration through virtualization using Docker. The goal is to build a small infrastructure composed of multiple services, each running in its own container, orchestrated using Docker Compose.

The project focuses on understanding how containers interact, how services communicate within a virtual network, and how persistent data is managed. It also introduces best practices for deploying services securely and efficiently in isolated environments.

The infrastructure typically includes services such as:
- NGINX (web server with TLS)
- WordPress (application server)
- MariaDB (database server)

Each service runs in a dedicated container and communicates through a Docker network.

---

## Instructions

### Requirements
- Docker installed
- Docker Compose installed
- Linux-based system (recommended)
- secrets directory at root of repository containing .txt files for required passwords
- .env-file in "srcs" directory containing the required variables

### Setup

Clone the repository:
```bash
git clone <repository-url> inception
cd inception
```

Build and start the project:
```bash
make up
```
Starts all services in detached mode. Docker images are built only if they don’t already exist.

For rebuilding and starting use:
```bash
make re
```
Forces a rebuild of all Docker images and recreates the containers.

Stop the running containers:
```bash
make down
```


Access:

Once running, the WordPress site is available at:
https://localhost or https://lhagemos.42.de

To test both configured wordpress users go to:
https://lhagemos.42.de/wp-login.php

---

## Resources

Documentation & Tutorials
https://www.youtube.com/watch?v=bKFMS5C4CG0
https://docs.docker.com/build/concepts/dockerfile/
https://developer.mozilla.org/en-US/docs/Web/Security/Defenses/Transport_Layer_Security
https://www.cyberciti.biz/faq/configure-nginx-to-use-only-tls-1-2-and-1-3/
https://medium.com/@yakuphanbilgic3/create-self-signed-certificates-and-keys-with-openssl-4064f9165ea3
https://www.youtube.com/watch?v=DM65_JyGxCo
https://docs.docker.com/
https://docs.docker.com/compose/
https://mariadb.com/kb/en/
https://wordpress.org/support/
https://nginx.org/en/docs/


### AI Usage

Artificial Intelligence was used in this project for:

Understanding Docker concepts (networks, volumes, containers)
Debugging configuration issues (Docker Compose, NGINX setup)
Structuring documentation (README formatting and clarity)
Explaining architectural differences (VM vs Docker, secrets vs env variables)

AI was not used to generate the entire project code, but rather as a learning and assistance tool during development and troubleshooting.

---

## Project Description (Docker & Design Choices)

This project uses Docker to simulate a small production-like environment. Each service is containerized to ensure isolation, reproducibility, and scalability.

### Docker Usage

Docker is used to:

Isolate services into separate containers
Ensure reproducible environments
Simplify deployment and configuration
Manage inter-service networking

A Docker Compose file orchestrates the containers and defines:

Networks
Volumes
Build context
Service dependencies

### Sources Included

The project typically includes:

A custom NGINX container (TLS termination)
A WordPress container (PHP-FPM)
A MariaDB container (database backend)
Docker volumes for persistent data
A Docker network for internal communication

### Design Choices

#### Virtual Machines vs Docker
Virtual Machines emulate full operating systems and are heavier in resource usage.
Docker containers share the host kernel and are lightweight, faster to start, and more efficient.
Docker was chosen for its simplicity and performance in service orchestration.

#### Secrets vs Environment Variables
Environment variables are simple but visible and less secure.
Secrets are stored more securely and are not exposed directly in container configurations.
For sensitive data (passwords, database credentials), secrets are preferred.

#### Docker Network vs Host Network
Docker networks isolate containers and allow controlled communication.
Host network shares the host’s networking stack, reducing isolation and security.
This project uses a custom bridge network for secure inter-service communication.

#### Docker Volumes vs Bind Mounts
Volumes are managed by Docker and are preferred for persistent data.
Bind mounts directly link host directories, useful for development but less secure.
This project uses volumes to persist:
- WordPress files
- MariaDB database data

