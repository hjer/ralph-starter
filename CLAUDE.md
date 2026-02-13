# CLAUDE.md

## Project

**ralph-starter** — a scaffold for the Ralph Wiggum autonomous AI development loop. Clone it, write specs, run the loop.

## Devcontainer

The project runs in a sandboxed devcontainer. Setup:

1. `cp .devcontainer/.env.example .devcontainer/.env` and fill in values
2. `devcontainer up --workspace-folder .`
3. First time: `devcontainer exec --workspace-folder . claude` → `/login`

### Container access model

- **Project directory** — read-write (the only writable data)
- **`~/.claude`** — Claude Code auth (bind mount)
- **Git push** — scoped to repos allowed by the `GH_TOKEN` in `.devcontainer/.env`
- **No access to** host home directory, SSH keys, other repos, or macOS keychain

### Running the loop

```bash
devcontainer exec --workspace-folder . ./loop.sh plan    # planning
devcontainer exec --workspace-folder . ./loop.sh         # building
```

### Files

| File | Purpose |
|---|---|
| `.devcontainer/devcontainer.json` | Container config — features, mounts, env |
| `.devcontainer/Dockerfile` | Base image + dev tools (jq, ripgrep, fzf) |
| `.devcontainer/post-start.sh` | Git identity, safe.directory, gh auth |
| `.devcontainer/.env.example` | Template for secrets |
| `.devcontainer/.env` | Actual secrets (gitignored) |

### Rebuilding

```bash
devcontainer up --workspace-folder . --remove-existing-container
```
