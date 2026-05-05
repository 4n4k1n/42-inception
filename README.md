*This project has been created as part of the 42 curriculum by anakin.*

# Inception

## Description

Docker infrastructure with three services: NGINX (TLS termination), WordPress + php-fpm, and MariaDB. NGINX is the only entry point, on port 443 only.

**Virtual Machines vs Docker:** VMs emulate hardware and run a full OS. Docker containers share the host kernel and are lightweight. Docker is used here for service isolation without the overhead of a VM.

**Secrets vs Environment Variables:** Env vars are visible in `docker inspect`. Docker secrets are mounted as files inside containers and never exposed. This project uses `.env` as required by the subject.

**Docker Network vs Host Network:** `host` network gives containers direct access to the host stack with no isolation. A named bridge network isolates containers and allows only explicit connections. This project uses a bridge network.

**Docker Volumes vs Bind Mounts:** Bind mounts link a host path directly. Named volumes are managed by Docker. This project uses named volumes with bind-mount options pointing to `/home/anakin/data`.

## Instructions

```bash
cp srcs/.env.example srcs/.env
# fill in srcs/.env with your credentials

make        # build and start
make down   # stop
make clean  # stop and delete all data
make re     # clean + rebuild
```

Visit `https://<login>.42.fr` — accept the self-signed certificate warning.

## Resources

- https://docs.docker.com/
- https://nginx.org/en/docs/http/configuring_https_servers.html
- https://developer.wordpress.org/cli/commands/
- https://mariadb.com/kb/en/installing-and-using-mariadb-via-docker/

**AI usage:** Used for documentation
