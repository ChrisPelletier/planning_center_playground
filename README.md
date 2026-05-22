# PlanningCenterPlayground

To start your Phoenix server:

- Run `mix setup` to install and setup dependencies
- Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

- Official website: https://www.phoenixframework.org/
- Guides: https://hexdocs.pm/phoenix/overview.html
- Docs: https://hexdocs.pm/phoenix
- Forum: https://elixirforum.com/c/phoenix-forum
- Source: https://github.com/phoenixframework/phoenix

## Git hooks

This repository includes a local `pre-commit` hook that runs `mix format` to ensure code is formatted before commits.

- To enable the hooks for your local clone run:

```bash
chmod +x bin/install-git-hooks
bin/install-git-hooks
```

- What the hook does: it runs `mix format` and aborts the commit if formatting modified files. If the hook stops your commit, stage the formatted changes with `git add -A` and commit again.

- To disable or unset the repository hook path you can run:

```bash
git config --local --unset core.hooksPath
```
