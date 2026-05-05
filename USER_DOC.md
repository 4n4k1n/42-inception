# User Documentation

## Services

- **NGINX** — HTTPS reverse proxy on port 443
- **WordPress** — website and admin panel
- **MariaDB** — database (internal, not directly accessible)

## Start and stop

```bash
make        # start
make down   # stop (data kept)
make clean  # stop and delete all data
```

## Access

- Website: `https://<login>.42.fr`
- Admin panel: `https://<login>.42.fr/wp-admin`

Accept the self-signed certificate warning in the browser.

## Credentials

All credentials are in `srcs/.env`.

## Check services

```bash
docker compose ps
docker compose logs nginx
docker compose logs wordpress
docker compose logs mariadb
```

All three containers should show status `Up`. They restart automatically on crash.
