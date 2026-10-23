# Microsoft 365 E5 Renew X · Docker

Docker image for [Microsoft 365 E5 Renew X](https://github.com/ZeroReiNull/docker_ms365_e5_renewx), originally developed by SundayRX.

## Quick start

1. Clone the repository and enter the directory:

   ```bash
   git clone https://github.com/ZeroReiNull/docker_ms365_e5_renewx.git
   cd docker_ms365_e5_renewx
   ```

2. **Change `LoginPassword`** in `Deploy/Config.xml` before starting.
3. Launch the container:

   ```bash
   docker compose up -d
   ```

Open **http://localhost:8066** · [Admin login](http://localhost:8066/Admin/Login)

## Configuration

| Path | Purpose |
| --- | --- |
| `Deploy/Config.xml` | Application settings |
| `appdata/` | Persistent data (created automatically) |
| `docker-compose.yaml` | Image, port and volumes |

## Commands

```bash
docker compose logs -f    # Logs
docker compose pull       # Pull latest image
docker compose up -d      # Start / update
docker compose down       # Stop
```

> [!IMPORTANT]
> This image uses **.NET Core 3.1**, which is no longer supported. The default port `8066` is bound to all host interfaces; for local-only access, change the Compose port mapping to `127.0.0.1:8066:8066`. Back up `Deploy/` and `appdata/` before updating.

## Credits

Unofficial Docker packaging of SundayRX's Microsoft 365 E5 Renew X. Thanks to the original contributors.
