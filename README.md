# Microsoft 365 E5 Renew X — Docker

Docker packaging and deployment files for [Microsoft 365 E5 Renew X](https://github.com/iyear/E5SubBot) — based on **SundayRX's E5 Renew X** project.

> [!IMPORTANT]
> This repository contains an older, unofficial deployment setup. Its Dockerfile uses **.NET Core 3.1**, which is out of support. Review the upstream project's current status and security implications before deploying, especially on a public server. This project does not guarantee Microsoft 365 developer subscription renewal.

## Quick start

Docker and Docker Compose are required.

Clone the repository:

```bash
git clone https://github.com/ZeroReiNull/docker_ms365_e5_renewx.git
cd docker_ms365_e5_renewx
```

Create the persistent data directory:

```bash
mkdir -p appdata
```

Edit `Deploy/Config.xml` **before starting**. At a minimum, replace the sample administrator password in `<LoginPassword>` with a strong, unique password. The configuration's application port is `1066`.

Start the service:

```bash
docker compose up -d
```

The included Compose file uses the prebuilt image `xntu/ms365_renewx:latest` and publishes container port `1066` on host port `8066`.

Open `http://localhost:8066` on the Docker host, or your server's address if you've configured network access. The administrator login route is `/Admin/Login`.

> [!WARNING]
> The supplied Compose file binds port `8066` on all host interfaces. For local-only access or a reverse proxy on the same host, change `"8066:1066"` to `"127.0.0.1:8066:1066"`. Do not expose the administrator interface directly to the public internet without appropriate access controls and HTTPS.

## Configuration and data

| Path | Purpose |
| --- | --- |
| `docker-compose.yaml` | Container image, ports, timezone, and volume mounts |
| `Deploy/Config.xml` | Application settings, including port, administrator password, HTTPS, and optional sharing features |
| `appdata/` | Persistent application data (created locally) |
| `Dockerfile` | Legacy image-build definition |
| `Microsoft365_E5_Renew_X.zip` | Bundled application archive |

The Compose service mounts `./Deploy/` at `/renewx/Deploy/` and `./appdata/` at `/renewx/appdata/`. Keep both directories when recreating the container and back up their contents securely.

The default Compose timezone is `America/New_York`; edit `TZ` if needed. The supplied `Config.xml` disables application-level HTTPS and site sharing by default. If you enable those features, configure certificates, authentication, and any required secrets carefully.

**Do not commit real passwords, tokens, or other private deployment data.** The checked-in `Deploy/Config.xml` is a template containing an insecure sample password; change it before use.

## Common commands

```bash
# View logs
docker compose logs -f renewx

# Stop the service
docker compose down

# Pull the configured image and recreate the container
docker compose pull
docker compose up -d
```

Updating to a newer image can introduce compatibility changes. Back up `Deploy/` and `appdata/` first.

## Building locally

The `Dockerfile` expects an **extracted** application directory named `Microsoft365_E5_Renew_X/` in the repository root. The included ZIP alone is not sufficient for `docker build`.

After ensuring that the extracted directory contains the expected .NET application files:

```bash
docker build -t ms365-renewx:local .
```

To use this image with Compose, change `image:` to `ms365-renewx:local` in `docker-compose.yaml`.

Note that the Dockerfile's `EXPOSE 8066` is metadata only; the included `Config.xml` sets the application listener to `1066`, which is why Compose maps `8066:1066`.

## Credits

This repository is an unofficial Docker deployment/package of SundayRX's Microsoft 365 E5 Renew X, not the original application. Credit for the application belongs to its original author(s) and contributors. Refer to the original project's distribution terms and documentation before redistributing or modifying the application.
