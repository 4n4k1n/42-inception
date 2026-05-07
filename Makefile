DATA_DIR = /home/$(USER)/data

all:
	mkdir -p $(DATA_DIR)/wordpress $(DATA_DIR)/mariadb
	grep -qF '$(USER).42.fr' /etc/hosts || echo '127.0.0.1	$(USER).42.fr' | sudo tee -a /etc/hosts
	docker compose -f ./srcs/docker-compose.yml up --build -d

down:
	docker compose -f ./srcs/docker-compose.yml down

clean:
	docker compose -f ./srcs/docker-compose.yml down -v
	sudo rm -rf $(DATA_DIR)

re: clean all

.PHONY: all down clean re
