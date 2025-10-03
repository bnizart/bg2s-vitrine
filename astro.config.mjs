// @ts-check
import { defineConfig } from 'astro/config';
import tailwindcss from "@tailwindcss/vite";
import icon from "astro-icon";
import sitemap from "@astrojs/sitemap";

// https://astro.build/config
export default defineConfig({
  site: "https://bg2s.com",
  vite: {
    // @ts-ignore
    plugins: [tailwindcss()],
    build: {
      sourcemap: false,
    },
  },
  integrations: [
    icon(),
    sitemap(),
  ],
});