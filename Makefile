DATA_DIR = /home/$(USER)/data

all:
	mkdir -p $(DATA_DIR)/wordpress $(DATA_DIR)/mariadb
	grep -qF '$(USER).42.fr' /etc/hosts || echo '127.0.0.1	$(USER).42.fr' | sudo tee -a /etc/hosts
	docker compose -f ./srcs/docker-compose.yml up --build -d

down:
	docker compose -f ./srcs/docker-compose.yml down

clean:
	docker compose -f ./srcs/docker-compose.yml down -v
	-docker stop $$(docker ps -qa) 2>/dev/null || true
	-docker rm $$(docker ps -qa) 2>/dev/null || true
	-docker rmi -f $$(docker images -qa) 2>/dev/null || true
	-docker volume rm $$(docker volume ls -q) 2>/dev/null || true
	-docker network rm $$(docker network ls -q) 2>/dev/null || true
	sudo rm -rf $(DATA_DIR) || true

re: clean all

ps:
	docker compose -f ./srcs/docker-compose.yml ps

.PHONY: all down clean re
