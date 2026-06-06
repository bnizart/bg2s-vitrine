# BG2S Website

**BG2S** is a private security company based in France.
[https://www.bg2s.com](https://www.bg2s.com)

## Optimisation

![lightouse](https://webdav.nizart.me/projects/bg2s-website/lighthouse.png)

![security-headers](https://webdav.nizart.me/projects/bg2s-website/security-headers.png)

## Technos

- **[Astro.js](https://astro.build/)** — Static site generator focused on performance.
- **[Caddy](https://caddyserver.com/)** — Automatic HTTPS, serves built static files.
- **[Docker](https://www.docker.com/)** — Containerized builds via GitHub Actions → GHCR.
- **[Umami](https://umami.is/)** — Privacy-friendly web analytics.
- **[TailwindCSS](https://tailwindcss.com/)** — Advanced CSS framework.

## Server setup

The `compose.yaml` lives on the server, not in this repo. Example:

```yaml
services:
  site:
    image: ghcr.io/bnizart/bg2s-vitrine:latest
    restart: unless-stopped
    ports:
      - "80:80"
      - "443:443"
      - "443:443/udp"
    volumes:
      - caddy_data:/data
      - caddy_config:/config

volumes:
  caddy_data:
  caddy_config:
```

On deploy, CI SSHes into the server and runs:

```bash
docker compose pull && docker compose up -d
```
