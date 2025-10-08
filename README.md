# BG2S Website

**BG2S** is a private security company based in France.
[https://www.bg2s.com](https://www.bg2s.com)

## Optimisation

![lightouse](https://webdav.nizart.me/projects/bg2s-website/lighthouse.png)

![security-headers](https://webdav.nizart.me/projects/bg2s-website/security-headers.png)

## Technos

- **[Astro.js](https://astro.build/)** — Static site generator focused on performance.
- **Nginx (Docker)** — Used to serve the built static files.
- **Docker Compose** — For both local and production deployments.
- **Umami** — Privacy-friendly web analytics.
- **TailwindCSS** — Advanced CSS framework.

## Docker

Build image :

```bash
docker build -t bg2s-website .
```

Run server :

```bash
docker run -it --rm -p 8043:80 bg2s-website
```

