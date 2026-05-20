# docker commands:
# - up: create and start containers
# - down: stop and remove containers, networks, images and volumes
# - start: start existing containers
# - stop: stop running containers
# - ps: list containers
# - exec: run a command in a running container
# - restart: restart running containers
# - build: build images
# - logs: view output from containers
# - pull: pull images from a registry
# - push: push images to a registry

# - docker network ls

all : up

up:
	@docker-compose -f ./srcs/docker-compose.yml up -d > docker_logs.txt 2>&1

re:
	@docker-compose -f ./srcs/docker-compose.yml up -d --build
logs:
	@docker-compose -f ./srcs/docker-compose.yml up -d --build
	@docker-compose -f ./srcs/docker-compose.yml logs -f
down:
	@docker-compose -f ./srcs/docker-compose.yml down

stop:
	@docker-compose -f ./srcs/docker-compose.yml stop 

start:
	@docker-compose -f ./srcs/docker-compose.yml start

ps:
	@docker ps

nginx :
	@docker-compose -f ./srcs/docker-compose.yml exec nginx sh || true

wp :
	@docker-compose -f ./srcs/docker-compose.yml exec wordpress bash || true

mdb :
	@docker-compose -f ./srcs/docker-compose.yml exec mariadb bash || true

clean :
	@docker system prune

fclean :
	@docker system prune --volumes -a
	@ sudo rm -rf /home/lhagemos/data/mariadb/*
	@ sudo rm -rf /home/lhagemos/data/wordpress/*

#cd /var/www/html
#./wp-cli.phar user list --allow-root
