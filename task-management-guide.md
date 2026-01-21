# Task Management Guide

A human-readable guide to the task management system for agentic development.

## Why This System?

Agentic code editors (Claude Code, Cursor, Windsurf, etc.) work best with:

1. **Clear task boundaries** - Agents lose context in long sessions. Small, well-defined tasks prevent drift.

2. **Session resumption** - Agents start fresh each session. Per-task state files tell them where to pick up.

3. **Minimal context loading** - Agents have limited context windows. Split index from details so they load only what's needed.

4. **Explicit IDs** - Referencing "task v95" is cheaper than describing the task repeatedly.

## System Overview

```
tasks/
├── index.md          # What exists (quick scan)
├── state-<id>.md     # Per-task state (created when task starts, deleted when done)
├── next-ids.md       # What's next (prevent collisions)
├── details/          # Full specs (load on demand)
├── backlog/          # Future work (separate from active)
├── YYYYMM/           # History (out of active context)
└── cancelled/        # Rejected ideas (preserved for reference)
```

### Why This Structure?

| File | Problem Solved |
|------|----------------|
| `index.md` | Agent can see all tasks without loading details |
| `state-<id>.md` | Per-task state enables concurrent sessions without conflicts |
| `next-ids.md` | No ID collisions across sessions |
| `details/` | Full context loaded only when working on task |
| `backlog/` | "Someday" doesn't clutter "now" |
| `YYYYMM/` | Completed work archived, searchable, not in active context |

## Setup

### 1. Create Directory Structure

```bash
mkdir -p tasks/details tasks/backlog tasks/cancelled
```

### 2. Initialize Index Files

**tasks/index.md:**
```markdown
# Active Tasks

## Frontend

## Backend

## Infrastructure
```

**tasks/state-<id>.md** (created when starting a task):
```markdown
# Task State: <id>

## Task
<id> - <title from index>

## Last Action

## Next Step

## Blockers

## Decisions Made
```

State files are created per-task and deleted when the task completes. This allows multiple sessions to work on different tasks concurrently without conflicts.

**tasks/next-ids.md:**
```markdown
# Next Available IDs

## Active Tasks
| Category | Next ID |
|----------|---------|
| v | v5 |
| g | g5 |
| i | i5 |
| t | t5 |
| d | d5 |
| m | m5 |

## Backlog Tasks
| Category | Next ID |
|----------|---------|
| blv | blv5 |
| blg | blg5 |
| bli | bli5 |
```

**tasks/backlog/index.md:**
```markdown
# Backlog

Ideas and future work not yet scheduled.
```

### 3. Add Agent Instructions

Copy `templates/AGENT-INSTRUCTIONS.md` to your project root as `CLAUDE.md` or `AGENTS.md`:

```bash
# Global installation
cp ~/.prdwise/templates/AGENT-INSTRUCTIONS.md ./CLAUDE.md

# Per-project installation
cp prdwise/templates/AGENT-INSTRUCTIONS.md ./CLAUDE.md
```

Symlink the agent rules for automatic updates:

```bash
# Global installation
ln -s ~/.prdwise/agent-task-rules.md ./docs/agent-task-rules.md

# Per-project installation
ln -s prdwise/agent-task-rules.md ./docs/agent-task-rules.md
```

Edit the instructions file to replace `[PATH]` with your prdwise location and customize project-specific rules.

## Workflow

### Starting a Feature

1. **Small feature**: Create task directly in `tasks/details/`
2. **Large feature**: Create PRD first (`specs/prd-*.md`), then generate tasks

### Daily Work

1. Open editor, agent lists `tasks/state-*.md` to find active tasks
2. Agent resumes from state file or asks which task to work on
3. Work proceeds with task spec from `tasks/details/<id>.md`
4. Before closing, agent updates `tasks/state-<id>.md`

### Completing Work

1. Mark task `[x]` in index when done
2. Archive when ready (condense details, move to `YYYYMM/`)

## Task ID Categories

Customize for your project. The goal is quick identification:

| Prefix | Typical Use |
|--------|-------------|
| f | Frontend |
| b | Backend |
| i | Infrastructure |
| t | Testing |
| d | Database |
| m | Documentation |
| s | Static/marketing |

**Examples by stack:**
- Python/Django: `f` (frontend), `b` (backend), `d` (database)
- React/Node: `r` (React), `n` (Node), `d` (database)
- Go/Vue: `v` (Vue), `g` (Go), `d` (database)

Backlog tasks prefix with `bl`: `blf5`, `blb10`, etc.

### Why +5 Increments?

Leaves room for inserting related tasks:
- v95, v100, v105 are planned
- v97 can be inserted if v95 needs a follow-up

Subtasks use +0.5: v100.0, v100.5, v101.0

## Tips

### Keep Tasks Small

If a task description exceeds 100 lines, split it. Agents work better with focused scope.

### Update State Before Ending

The state file is only useful if current. Make updating `tasks/state-<id>.md` part of your end-of-session routine.

### Archive Promptly

Completed tasks in `index.md` add noise. Archive after verification to keep the active list clean.

### Use Backlog Generously

Ideas that aren't actionable now belong in backlog, not active tasks. Promote when ready.

## VCS Notes

This system is VCS-agnostic. Works with:
- Git
- Mercurial
- No VCS (just files)

The `tasks/` directory can be:
- Committed (shared with team)
- Ignored (personal workflow)
- Partially committed (index yes, details optional)
