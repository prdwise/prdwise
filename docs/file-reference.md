# prdwise File Reference

Complete reference for all prdwise files and their purposes.

## Setup

| File | Purpose |
|------|---------|
| `setup.sh` | Interactive setup script for new projects |
| `defaults/` | User overrides for templates (survives `hg pull`) |
| `credits.md` | Attribution for adapted work |

## Profiles

Project type profiles that customize categories, PRD sections, and task fields.

| Profile | Use Case |
|---------|----------|
| `profiles/technical/` | Software, APIs, infrastructure |
| `profiles/writing/` | Articles, content, documentation |
| `profiles/business/` | Operations, marketing, processes |

Each profile contains: `next-ids.md`, `prd-sections.md`, `task-fields.md`, `index-sections.md`

## Core - Task Management

| File | Purpose |
|------|---------|
| `agent-task-rules.md` | Terse task rules for agents - symlink or copy |
| `task-management-guide.md` | Full explanation with rationale |
| `templates/AGENT-INSTRUCTIONS-template.md` | Template for project's CLAUDE.md |

## Core - Development

| File | Purpose |
|------|---------|
| `create-prd.md` | Agent instructions for product/project planning |
| `create-task.md` | Agent instructions for individual feature/task creation |
| `generate-tasks.md` | Agent instructions for breaking PRD into tasks |
| `templates/phases-template.md` | Template for multi-phase work (use when 5+ tasks with dependencies) |

## Content Creation

| File | Purpose |
|------|---------|
| `create-article.md` | Agent instructions for article brief creation |
| `templates/article-brief-template.md` | Template for article specs |

## Specialized Workflows

| File | Purpose |
|------|---------|
| `workflows/debugging-workflow.md` | Systematic debugging methodology |
| `workflows/data-analysis-workflow.md` | Data analysis and reporting methodology |
| `workflows/visualization-workflow.md` | Diagram and visualization methodology |

## Standards & Templates

| File | Purpose |
|------|---------|
| `standards.md` | Spec-first workflow and guidelines |
| `templates/tech-stack-template.md` | Template for `docs/tech-stack.md`; reference from agent instructions |
| `templates/adr-template.md` | Architecture Decision Record template |

## Scripts

| File | Purpose |
|------|---------|
| `scripts/T` | Task management CLI - list, view, edit tasks from terminal |

### Adding Scripts to PATH

**Bash** (`~/.bashrc`):
```bash
export PATH="$PATH:$HOME/.prdwise/scripts"
```

**Zsh** (`~/.zshrc`):
```zsh
path+=("$HOME/.prdwise/scripts")
```

**direnv** (project `.envrc`):
```bash
PATH_add ~/.prdwise/scripts
```

After setup, run `T h` from any prdwise project to see available commands.

### Editor Configuration

The `T` script uses `$VISUAL`, then `$EDITOR`, then `vi`. To use a graphical editor:

```bash
export VISUAL=gvim    # or: code, subl, etc.
```
