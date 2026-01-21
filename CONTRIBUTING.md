# Contributing to prdwise

Guidelines for contributing to the prdwise framework.

## Overview

prdwise is a **library** that other projects reference. Files here are:
- Symlinked into projects (agent rules)
- Copied as templates (INSTRUCTIONS.md → CLAUDE.md)
- Read for guidance (human docs)

## File Categories

| Type | Files | Edit Carefully |
|------|-------|----------------|
| Agent rules | `agent-task-rules.md` | Yes - projects symlink this |
| Agent instructions | `create-prd.md`, `generate-tasks.md` | Yes - projects reference these |
| Workflows | `debugging-workflow.md`, `data-analysis-prompts.md`, `visualization-prompts.md` | Moderate |
| Templates | `INSTRUCTIONS.md`, `adr-template.md`, `phases-template.md`, `tech-stack-template.md` | Moderate - copied, not linked |
| Human docs | `README.md`, `task-management-guide.md` | Lower risk |
| Standards | `standards.md` | Yes - defines conventions |

## Editing Rules

### Breaking Changes

Changes to `agent-task-rules.md` affect all projects that symlink it. Before modifying:
1. Consider if change is backwards compatible
2. Update any examples in `task-management-guide.md` to match
3. Check `INSTRUCTIONS.md` template references still valid

### Attribution

All credits are consolidated in `credits.md`. When adapting external work, add the source there rather than in individual files.

### Consistency

Keep terminology consistent across files:
- `tasks/state.md` (not status.md, current.md)
- `tasks/details/` (not specs/, task-details/)
- `[i]` for in-progress (not `[>]`, `[~]`)

### Stack Agnostic

Keep all files stack-agnostic. Users define their own stack using `tech-stack-template.md`.

## No Task Tracking Here

This is a docs-only library. No `tasks/` directory needed.
