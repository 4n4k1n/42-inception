DATA_DIR = /home/anakin/data

all:
	mkdir -p $(DATA_DIR)/wordpress $(DATA_DIR)/mariadb
	docker compose up --build -d

down:
	docker compose down

clean:
	docker compose down -v
	sudo rm -rf $(DATA_DIR)

re: clean all

.PHONY: all down clean re
