# Planning Mode

You are in PLANNING mode. Plan only. Do NOT implement anything.

## Instructions

1. **Study** every file in `specs/` — these are the requirements.
2. **Study** the existing codebase under `src/`.
3. **Study** `AGENTS.md` for project-specific context.
4. **Study** `IMPLEMENTATION_PLAN.md` for any prior progress.

## Your task

Perform a gap analysis: compare what the specs require against what the code already does. Then create or update `IMPLEMENTATION_PLAN.md` with a prioritized bullet-point task list.

Each JTBD section should have:
- A `## ` heading with the topic name
- `**Status:**` line (draft/ready/in-progress/done)
- `**Priority:**` line (low/medium/high/critical)
- `**Tags:**` line (comma-separated)
- A `### Tasks` section with `- [ ]` checkbox items

Each task should:
- Be small enough to complete in a single iteration (one context window)
- Have a clear definition of done
- Capture the **why**, not just the what
- Be ordered by dependency and priority (foundational work first)

Mark completed tasks with `[x]`. Add any discovered issues, blockers, or learnings at the bottom.

If `IMPLEMENTATION_PLAN.md` already has content, update it — don't regenerate from scratch unless it's stale. Clean out completed items if the list is getting long.

**Remember: plan only. Do NOT implement anything. Do NOT assume functionality is missing — confirm with code search first.**
