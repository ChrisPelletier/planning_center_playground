import { defineConfig } from "vite";
import react from "@vitejs/plugin-react";

console.log("VITE CWD", process.cwd());

export default defineConfig(({ command }) => {
  const isDev = command !== "build";
  if (isDev) {
    // Terminate the watcher when Phoenix quits
    process.stdin.on("close", () => {
      process.exit(0);
    });

    process.stdin.resume();
  }
  return {
    plugins: [react()],
    build: {
      // Output to priv/static so Phoenix can serve it
      outDir: "../priv/static",
      emptyOutDir: false,
      sourcemap: isDev, // enable source map in dev build
      manifest: true,
      rollupOptions: {
        input: "js/index.tsx",
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
  };
});
