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

### Setup

Clone the repository:
```bash
git clone <repository-url>
cd inception
```

Build and start the project:
```bash
make up
```

Stop the running containers:
```bash
make down
```


Access:
Once running, the WordPress site is available at:
https://localhost, https://lhagemos.42.de or https://www.lhagemos.42.de


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

## Resources
Documentation & Tutorials
https://docs.docker.com/
https://docs.docker.com/compose/
https://mariadb.com/kb/en/
https://wordpress.org/support/
https://nginx.org/en/docs/

Learning Materials
Docker networking basics
Container vs VM architecture explanations
TLS/SSL configuration guides for NGINX

### AI Usage

Artificial Intelligence was used in this project for:

Understanding Docker concepts (networks, volumes, containers)
Debugging configuration issues (Docker Compose, NGINX setup)
Structuring documentation (README formatting and clarity)
Explaining architectural differences (VM vs Docker, secrets vs env variables)

AI was not used to generate the entire project code, but rather as a learning and assistance tool during development and troubleshooting.