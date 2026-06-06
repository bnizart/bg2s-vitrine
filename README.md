# BG2S Website

**BG2S** is a private security company based in France.
[https://www.bg2s.com](https://www.bg2s.com)

## Optimisation

![lightouse](https://webdav.nizart.me/projects/bg2s-website/lighthouse.png)

![security-headers](https://webdav.nizart.me/projects/bg2s-website/security-headers.png)

## Technos

- **[Astro.js](https://astro.build/)** — Static site generator focused on performance.
- **[Caddy](https://caddyserver.com/)** — Serves static files over HTTP (TLS handled by reverse proxy).
- **[Docker](https://www.docker.com/)** — Containerized builds via GitHub Actions → GHCR.
- **[Umami](https://umami.is/)** — Privacy-friendly web analytics.
- **[TailwindCSS](https://tailwindcss.com/)** — Advanced CSS framework.

## Server setup

The container runs behind a reverse proxy (e.g. Nginx Proxy Manager) on the same Docker `proxy` network. TLS is handled by the proxy, not Caddy.

The `compose.yaml` lives on the server, not in this repo:

```yaml
networks:
  proxy:
    external: true

services:
  site:
    container_name: bg2s-vitrine
    image: ghcr.io/bnizart/bg2s-vitrine:latest
    restart: unless-stopped
    networks:
      - proxy
```

Configure your reverse proxy to forward `bg2s.com` → `http://bg2s-vitrine:80` with SSL termination.

On deploy, CI SSHes into the server and runs:

```bash
docker compose pull && docker compose up -d
```
