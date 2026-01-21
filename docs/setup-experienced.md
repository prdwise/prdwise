# Quick Setup Guide

For experienced users who want to get started quickly.

## Prerequisites

- Mercurial installed (`hg --version`) - [installation guide](https://www.mercurial-scm.org/wiki/Download)
- prdwise cloned to `~/.prdwise/` or `./prdwise/`
- Project directory exists

## Run Setup

From your project directory:

```bash
# If installed to ~/.prdwise/
~/.prdwise/setup.sh

# If installed per-project
./prdwise/setup.sh
```

The script creates:
- `tasks/` - Task tracking (index.md, next-ids.md, details/)
- `specs/` - PRDs and specs
- `docs/` - Project documentation
- `docs/tech-stack.md` - Critical: prevents hallucinations
- `CLAUDE.md` - Agent instructions (symlink or copy to `.cursorrules`)

## Zero-Token Management

The `T` CLI manages tasks without using tokens:

```bash
T l        # List active tasks
T d b45    # Show details for task b45
T e b45    # Edit task b45 in your editor
T s b45    # Check current state/progress
```

Add to your shell (setup.sh prompts for this):

```bash
# Bash (~/.bashrc)
export PATH="$PATH:$HOME/.prdwise/scripts"

# Zsh (~/.zshrc)
path+=("$HOME/.prdwise/scripts")

# direnv (project .envrc)
PATH_add ~/.prdwise/scripts
```

## Key Files Reference

| File | Purpose |
|------|---------|
| `agent-task-rules.md` | Terse task rules for agents |
| `create-prd.md` | Product/project planning instructions |
| `create-task.md` | Individual task creation |
| `generate-tasks.md` | Break PRD into tasks |
| `workflows/*.md` | Debugging, analysis, visualization |

See [File Reference](file-reference.md) for complete list.

## Start Working

| What you want | Tell your AI |
|---------------|--------------|
| New project | "New project: Build a CLI tool that..." |
| New feature | "New feature: Add dark mode support" |
| Bug fix | "New task: Fix the login timeout bug" |

Your AI reads the prdwise instructions and guides you through creating specs or tasks.

## Editor Integration
Use setup.sh to create agent file for your particular agentic editor
