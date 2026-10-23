# Microsoft 365 E5 Renew X — Docker

Unofficial Docker deployment for **SundayRX's Microsoft 365 E5 Renew X**.

## Quick start

```bash
git clone https://github.com/ZeroReiNull/docker_ms365_e5_renewx.git
cd docker_ms365_e5_renewx
docker compose up -d
```

Before starting, **change the default administrator password** in `Deploy/Config.xml` (`LoginPassword`). No need to create `appdata/` manually; Docker Compose creates it automatically.

Access the service at **http://localhost:8066** (admin login: `/Admin/Login`).

## Configuration

- `Deploy/Config.xml` — application settings
- `appdata/` — persistent data
- `docker-compose.yaml` — ports, volumes and image (`xntu/ms365_renewx:latest`)

```bash
docker compose logs -f   # View logs
docker compose down      # Stop
```

> **Note:** The Dockerfile uses the unsupported .NET Core 3.1 runtime. The default Compose port mapping (`8066:8066`) is publicly bound; use `127.0.0.1:8066:8066` if accessing through a reverse proxy on the same host. Back up `Deploy/` and `appdata/` before updating.

Credits: **SundayRX** and the original E5 Renew X contributors.
