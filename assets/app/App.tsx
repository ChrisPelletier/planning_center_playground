import Home from "./routes/Home";
import { AppShell, Burger, NavLink, Text } from "@mantine/core";
import { useDisclosure } from "@mantine/hooks";
import { Routes, Route } from "react-router";

export default function App() {
  const [opened, { toggle }] = useDisclosure();

  return (
    <AppShell
      padding="md"
      header={{ height: 60 }}
      navbar={{
        width: 300,
        breakpoint: "sm",
        collapsed: { mobile: !opened },
      }}
    >
      <AppShell.Header bg="saber-blue">
        <Burger opened={opened} onClick={toggle} hiddenFrom="sm" size="sm" />

        <div>Logo</div>
      </AppShell.Header>
      <AppShell.Navbar>
        <NavLink href="/" label="Home" />
        <NavLink href="/user-list" label="User List" />
      </AppShell.Navbar>

      <AppShell.Main>
        <Routes>
          <Route path="/" element={<Home />} />
          <Route path="/user-list" element={<Text>User List</Text>} />
        </Routes>
      </AppShell.Main>
    </AppShell>
  );
}
