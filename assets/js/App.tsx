import { AppShell, Burger, Stack, Text } from "@mantine/core";
import { useDisclosure } from "@mantine/hooks";

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
      <AppShell.Navbar>Navbar</AppShell.Navbar>

      <AppShell.Main>
        <Stack>
          <Text color="dimmed">Planning Center Playground</Text>
        </Stack>
      </AppShell.Main>
    </AppShell>
  );
}
