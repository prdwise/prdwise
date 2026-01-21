# Agent Task Management Rules

Terse rules for agentic editors. Reference or symlink this file from your project's CLAUDE.md/AGENTS.md.

## Directory Structure

- `tasks/index.md` - Active tasks: [ ] pending, [i] in-progress, [x] done
- `tasks/next-ids.md` - ID allocation - READ BEFORE CREATING TASKS
- `tasks/details/<id>.md` - Task spec with state header (first 10 lines)
- `tasks/backlog/` - index.md + <blid>.md files
- `archives/YYYYMM/` - Archived tasks: <id>.md files
- `tasks/cancelled/` - Cancelled backlog items

## Session Start

1. Read `tasks/index.md` for task list and markers
2. If resuming: `grep "^State:\|^Next:" tasks/details/<id>.md` for current state
3. If starting fresh: ask user which task to work on

**Before implementing anything**: Confirm you have an active task in `index.md`. If user requests work with no matching task, create one first or ask which existing task it belongs to. Never write code without a task.

## Session End

Update header in `tasks/details/<id>.md`:
- Set `Next:` to specific next action
- Add `Blocked:` if blocked
- If work was done: ensure State reflects progress, update index.md marker

## Checking Task Status

Quick check: `grep "^State:\|^Outcome:" tasks/details/<id>.md`

Full context: Read first 10 lines of details file for:
- State: pending | in-progress | completed
- Next: current action (if in-progress)
- Blocked: blocker (if any)
- Outcome: deviations from spec (if completed)

If state seems incomplete, verify work evidence: check if files in "Files:" field exist/changed.

For completed tasks, also check "Done when" items are marked `[x]`.

Index.md markers `[ ]`/`[i]`/`[x]` should match State header. Report discrepancies.

## Creating Task

1. Read `tasks/next-ids.md` for exact next ID
2. Verify ID available: `tasks/details/<id>.md` and `archives/*/<id>.md` must not exist, `<id>` must not appear in `tasks/index.md`. If collision: re-read `next-ids.md`, repeat.
3. If task involves tooling, dependencies, or installation: read `docs/tech-stack.md`
4. Add to `tasks/index.md`: `- [ ] <id> brief description`
5. Create `tasks/details/<id>.md`:
   ```
   # <id>: Title
   State: pending

   ---

   **Context**: ...
   **Files**: ...
   **Steps**: ...
   **Done when**: ...
   ```
6. Update `tasks/next-ids.md` (+5 for top-level, +0.5 for subtask)

**Verify all three files modified before proceeding.**

## Starting Task

1. Update `tasks/details/<id>.md` header: `State: in-progress`
2. Add `Next:` line with first action
3. Change `[ ]` to `[i]` in `tasks/index.md`

## Completing Task

Agents may mark individual "Done when" items as `[x]` during work. State change requires user approval.

1. Verify all "Done when" items are `[x]`
2. If implementation differs from spec, note deviations for review
3. **Ask user to verify completion before proceeding**
4. After user approval, update `tasks/details/<id>.md`:
   - Set `State: completed`
   - Remove `Next:` and `Blocked:` lines
   - Add `Outcome:` if deviations exist
5. Update `tasks/index.md`: change `[i]` to `[x]`
6. **Verify both files updated before proceeding**
7. Do NOT condense or move files yet

## Archiving Task

**Ask user before archiving** - never archive automatically. Archive location: `archives/YYYYMM/` (e.g., `archives/202601/`).

1. Condense `tasks/details/<id>.md`:
   - Keep: title, 1-3 sentence summary, files touched, key decisions, date
   - Remove: code examples, step-by-step instructions, specs
   - Target: 15-50 lines
2. Create `archives/YYYYMM/` if missing; move `tasks/details/<id>.md` there
3. Remove line from `tasks/index.md`

## Backlog

**Create:** Get ID from `next-ids.md` → create `tasks/backlog/<blid>.md` → add to `tasks/backlog/index.md` → update `next-ids.md`

**Promote:** Get active ID → update ID in file → move to `tasks/details/<id>.md` → add to `tasks/index.md` → remove from `tasks/backlog/index.md` → update `next-ids.md`

**Cancel:** Move to `tasks/cancelled/<blid>.md` → remove from `tasks/backlog/index.md`

## Task IDs

Categories: Defined in `tasks/next-ids.md` (project-specific).

Increments: +5 top-level, +0.5 subtask. Backlog prefix: `bl`

## Critical Rules

**TASK FIRST**: User asks for implementation? STOP. Check `tasks/index.md` for matching task. No match → create task or clarify with user. Never write implementation code without an active task.

**Task Management**: Never create directly in `archives/` (archive only via workflow). Always read `next-ids.md` first. Always update all three files. Archive only named task, never batch.

**Workflow**: Never skip PRD to implementation - generate tasks first. All work tracked before starting.

**Paths**: Use relative paths from project root (`src/main.go`, not `/home/.../src/main.go`). Exception: `~/prdwise/` for framework refs. Never create files outside cwd. Verify no leading `/` before file operations.

**Tech Stack**: Read `docs/tech-stack.md` before suggesting package managers, install commands, or tool choices.

**Session Hygiene**: Update State/index before ending any session where work was done.
