DATA_DIR = /home/$(USER)/data

all:
	mkdir -p $(DATA_DIR)/wordpress $(DATA_DIR)/mariadb
	grep -qF '$(USER).42.fr' /etc/hosts || echo '127.0.0.1	$(USER).42.fr' | sudo tee -a /etc/hosts
	docker compose up --build -d

down:
	docker compose down

clean:
	docker compose down -v
	sudo rm -rf $(DATA_DIR)

re: clean all

.PHONY: all down clean re
