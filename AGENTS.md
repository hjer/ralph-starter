# AGENTS.md

Operational reference for autonomous Claude iterations.

## Build & Test

```bash
# TODO: Add your project's build/test commands here
# Examples:
# npm test
# pytest
# cargo test
# go test ./...
```

## Project Layout

```
# TODO: Describe your project structure
# src/          — application source code
# tests/        — test files
# specs/        — requirement specs (immutable)
# specs/archive/ — completed specs
```

## Development Loop

1. **Spec** — Humans write specs in `specs/`. Agents read them but **never modify them**.
2. **Plan** — Gap analysis and task breakdown go in `IMPLEMENTATION_PLAN.md`
3. **Implement** — Write code, run tests
4. **Update Context** — After every fix/feature/loop iteration, update:
   - `IMPLEMENTATION_PLAN.md` — mark tasks done, add sections for new work
   - `specs/todo.md` — check off completed items (only `specs/` file agents may update)
   - `AGENTS.md` — update if workflow or conventions changed
5. **Archive** — When a spec is fully done, move to `specs/archive/`, set `status: done`

**Specs are immutable requirements.** Never modify files in `specs/` (except `todo.md` checkboxes). All progress tracking goes in `IMPLEMENTATION_PLAN.md`.

Context updates are mandatory, not optional. Stale docs cause stale decisions.

## Spec Archive Rules

- Never delete finished specs
- Set `status: done` in frontmatter
- Move from `specs/` to `specs/archive/`
- Update `specs/todo.md` to mark the item as `[x]`

## Plan Archive Rules

- Move completed tasks from `IMPLEMENTATION_PLAN.md` to `IMPLEMENTATION_PLAN_ARCHIVE.md`
- Only move individual done tasks — plan sections stay until all their tasks are complete
- This keeps the active plan focused and prevents done work from being lost when the plan is regenerated

## Conventions

<!-- TODO: Add project-specific conventions -->
