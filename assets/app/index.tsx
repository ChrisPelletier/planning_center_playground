import "../assets/app.css";
import "@mantine/core/styles.css";
import { createRoot } from "react-dom/client";
import { BrowserRouter } from "react-router";
import { MantineProvider } from "@mantine/core";
import type { MantineThemeOverride } from "@mantine/core";
import App from "./App";

const theme: MantineThemeOverride = {
  primaryColor: "saber-blue",
  colors: {
    "saber-blue": [
      "#e3f2fd",
      "#bbdefb",
      "#90caf9",
      "#64b5f6",
      "#42a5f5",
      "#2196f3",
      "#1e88e5",
      "#1976d2",
      "#1565c0",
      "#0d47a1",
    ],
    "jedi-tan": [
      "#f5f2eb",
      "#eadecc",
      "#dec9a8",
      "#d3b584",
      "#c9a265",
      "#c3954f",
      "#bf8e42",
      "#a67732",
      "#865f24",
      "#664719",
    ],
  },
  components: {
    Button: {
      defaultProps: {
        radius: "xl",
      },
    },
  },
};

const container = document.getElementById("app") as HTMLElement;
createRoot(container).render(
  <BrowserRouter>
    <MantineProvider defaultColorScheme="light" theme={theme}>
      <App />
    </MantineProvider>
  </BrowserRouter>,
);
