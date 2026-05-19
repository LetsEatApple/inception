
```md id="devdoc1"
# Developer Documentation — Inception

*This project has been created as part of the 42 curriculum by <login1>[, <login2>[, <login3>]].*

---

## Environment Setup

### Prerequisites

Before starting, ensure the following are installed:

- Docker
- Docker Compose
- Make
- Linux-based system (recommended)

Check Docker:

```bash id="d_check"
docker --version
docker compose version
```

Project Configuration

The project uses:

A docker-compose.yml file for orchestration
A Makefile for simplified commands
Environment variables (.env) for configuration
Optional secrets for sensitive data

Build & Launch
Build and start all services

make
This will:

Build Docker images
Create a network
Start containers (NGINX, WordPress, MariaDB)

Stop services
make down

Rebuild from scratch
make re

Docker Compose Usage (manual alternative)
docker compose up --build

Stop:
docker compose down

Container Management

List running containers:
docker ps

View logs:
docker logs <container>

Enter a container:
docker exec -it <container> bash

Data Persistence

This project uses Docker volumes to persist data.

Stored data includes:
WordPress files
MariaDB database files
Location:

Docker manages volumes internally, typically under:
/var/lib/docker/volumes/
Named volumes are defined in docker-compose.yml.

Architecture Overview

The stack consists of:

NGINX container → HTTPS entry point
WordPress container → PHP application
MariaDB container → database backend

All services communicate via a dedicated Docker network.

Rebuilding / Resetting Data

To fully reset the environment:
make clean
This removes:

Containers
Images
Volumes (data loss)

Notes for Developers
Always ensure .env is properly configured before building.
Avoid storing secrets directly in Dockerfiles.
Use volumes for persistent data instead of container storage.
Keep services isolated per container for modularity.