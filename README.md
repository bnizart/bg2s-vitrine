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

TLS is handled by Nginx Proxy Manager. Caddy serves plain HTTP on port 80, NPM terminates SSL.

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

No port exposure needed — NPM reaches the container via the `proxy` Docker network.

**NPM config:**
- Proxy Host: `bg2s.com` → `http://bg2s-vitrine:80`
- SSL: Let's Encrypt, Force SSL enabled
- Redirect Host: `www.bg2s.com` → `https://bg2s.com` (301)

On deploy, CI SSHes into the server and runs:

```bash
docker compose pull && docker compose up -d
```
