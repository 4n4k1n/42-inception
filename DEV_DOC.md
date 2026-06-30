This project has been created as part of the 42 curriculum by apregitz

# Developer Documentation

## Prerequisites

- Docker and Docker Compose installed
- `sudo` access (for `/etc/hosts` entry)

## Environment setup

```bash
cp srcs/.env.example srcs/.env
# edit srcs/.env: set domain, DB credentials, WP admin and user credentials
```

`WP_ADMIN_USER` must not contain `admin` or `administrator` in any form.

## Build and launch

```bash
make        # creates /home/anakin/data dirs, adds hosts entry, builds and starts
make down   # stops containers
make clean  # stops containers, removes volumes and /home/anakin/data
make re     # clean + all
```

## Container and volume management

```bash
docker compose ps
docker compose logs -f <service>
docker exec -it <container> sh

docker volume ls
docker volume inspect inception_wp-files
docker volume inspect inception_db-data
```

## Data persistence

| Volume | Container path | Host path |
|--------|---------------|-----------|
| `inception_wp-files` | `/var/www/html` | `/home/anakin/data/wordpress` |
| `inception_db-data` | `/var/lib/mysql` | `/home/anakin/data/mariadb` |

Data survives `make down`. Deleted only by `make clean`.
