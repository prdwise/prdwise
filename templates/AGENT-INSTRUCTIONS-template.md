## Task Management

Read `[PATH]/agent-task-rules.md` BEFORE any task operation (create, start, complete, archive).

Profile: `[PROFILE]` — see `[PATH]/profiles/[PROFILE]/` for PRD sections and task fields

## Session Start
1. If tasks exist: check `tasks/index.md`, look for `[i]` in-progress markers
2. If resuming: read first 10 lines of `tasks/details/<id>.md` for state
3. If no active tasks: ask user what to work on

## Creating New Work

**Triggers** — when user says:
- "New project:" or "New product:" → Read `[PATH]/create-prd.md`, follow its process (ask questions → create PRD → generate tasks). Do NOT start implementation.
- "New feature:" or "New task:" → Read `[PATH]/create-task.md`, follow its process

For features, bug fixes, enhancements without trigger phrase:
1. Read `tasks/next-ids.md` for next available ID
2. Follow `[PATH]/create-task.md`

## Communication

Use plain language accessible to developers of all experience levels:
- Avoid jargon, architecture terms, and academic concepts without explanation
- Prefer concrete names over abstract patterns (e.g., "Shared Components" not "Cross-Cutting Concerns")
- When technical terms are necessary, briefly explain them
- Task descriptions should be understandable without deep framework knowledge

## Guardrails

### Task First
Before writing implementation code: confirm an active task exists in `tasks/index.md`. No matching task → create one or ask user which task this belongs to.

### File Paths
- Use relative paths for all project files (e.g., `src/`, `internal/`, not `/home/user/...`)
- Exception: `~/prdwise/` or `~/.prdwise/` allowed for framework references
- Never write files outside current working directory
- Verify all mkdir/touch/write commands use relative paths (no leading `/`)

## Tech Stack

Read `docs/tech-stack.md` before:
- Creating or updating task details
- Suggesting installation commands (npm/pnpm, pip/uv, etc.)
- Recommending tools, libraries, or frameworks
- Any implementation that touches build/tooling

## Project-Specific Rules

[CUSTOMIZE: Add project-specific rules below]

## File References

| Purpose | Location |
|---------|----------|
| Tech stack (tooling/standards) | `docs/tech-stack.md` |
| Task management rules | `[PATH]/agent-task-rules.md` |
| PRD creation (projects) | `[PATH]/create-prd.md` |
| Task creation (features) | `[PATH]/create-task.md` |
| Task generation from PRD | `[PATH]/generate-tasks.md` |
| Article creation | `[PATH]/create-article.md` |
| Debugging methodology | `[PATH]/workflows/debugging-workflow.md` |
| Data analysis methodology | `[PATH]/workflows/data-analysis-workflow.md` |
| Diagram generation | `[PATH]/workflows/visualization-workflow.md` |
| Active tasks | `tasks/index.md` |
| Task details (with state header) | `tasks/details/<id>.md` |
| Feature specs | `specs/prd-*.md` |
| Article specs | `specs/article-*.md` |
| Archived tasks | `archives/YYYYMM/<id>.md` |
