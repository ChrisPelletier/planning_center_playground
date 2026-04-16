import { defineConfig } from "vite";
import react from "@vitejs/plugin-react";

export default defineConfig(({ command }) => ({
  plugins: [react()],
  build: {
    // Output to priv/static so Phoenix can serve it
    outDir: "../priv/static",
    emptyOutDir: false,
    manifest: true,
    rollupOptions: {
      input: "js/index.jsx",
    },
  },
  server: {
    // In dev, Vite runs here and Phoenix proxies asset requests to it
    port: 5173,
    host: "localhost",
    // Fail immediately if port is taken rather than silently shifting ports,
    // which would break the hardcoded URLs in root.html.heex
    strictPort: true,
  },
}));
